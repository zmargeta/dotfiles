local module = {}

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

wezterm.GLOBAL.pane_search_direction = {}

local SearchDirection = {
  BACKWARD = 0,
  FORWARD = 1,
}

local MatchDirection = {
  NEXT = 0,
  PRIOR = 1,
}

module.WorkspaceSelect = wezterm.action_callback(function(window, pane)
  local active = mux.get_active_workspace()
  local workspaces = mux.get_workspace_names()
  local tab_count = {}

  for _, mux_win in ipairs(mux.all_windows()) do
    local curr = mux_win:get_workspace()
    if tab_count[curr] then
      tab_count[curr] = tab_count[curr] + #mux_win:tabs()
    else
      tab_count[curr] = #mux_win:tabs()
    end
  end

  local workspace_choices = {}
  for _, curr in ipairs(workspaces) do
    local label = curr .. ": " .. tab_count[curr] .. " tabs"
    if curr ~= active then
      table.insert(workspace_choices, { id = curr, label = label })
    else
      table.insert(workspace_choices, 1, { id = curr, label = label .. " (active)" })
    end
  end
  window:perform_action(
    act.InputSelector({
      title = "Select Workspace",
      choices = workspace_choices,
      action = wezterm.action_callback(function(_, _, id, _)
        if id then
          mux.set_active_workspace(id)
        end
      end),
    }),
    pane
  )
end)

module.RenameWorkspace = wezterm.action_callback(function(window, pane)
  window:perform_action(
    act.PromptInputLine({
      description = "Rename workspace: ",
      action = wezterm.action_callback(function(_, _, name)
        if name and name ~= "" then
          mux.rename_workspace(mux.get_active_workspace(), name)
        end
      end),
    }),
    pane
  )
end)

module.MovePaneToNewTab = wezterm.action_callback(function(_, pane)
  local tab, _ = pane:move_to_new_tab()
  tab:activate()
end)

local copy_mode = {}

copy_mode.CopyToClipboard = act.Multiple({
  act.CopyTo("Clipboard"),
  act.ClearSelection,
  act.CopyMode("ClearSelectionMode"),
})

copy_mode.Close = wezterm.action_callback(function(window, pane)
  if window:get_selection_text_for_pane(pane) ~= "" then
    window:perform_action(
      act.Multiple({
        act.ClearSelection,
        act.CopyMode("ClearSelectionMode"),
      }),
      pane
    )
  elseif wezterm.GLOBAL.pane_search_direction[tostring(pane)] then
    window:perform_action(copy_mode.ClearPattern, pane)
  else
    window:perform_action(act.CopyMode("Close"), pane)
  end
end)

local function search(direction)
  return wezterm.action_callback(function(window, pane)
    wezterm.GLOBAL.pane_search_direction[tostring(pane)] = direction
    window:perform_action(
      act.Multiple({
        act.CopyMode("ClearPattern"),
        act.CopyMode("EditPattern"),
      }),
      pane
    )
  end)
end

copy_mode.SearchForward = search(SearchDirection.FORWARD)

copy_mode.SearchBackward = search(SearchDirection.BACKWARD)

local function match(direction)
  local dir_b = direction == MatchDirection.NEXT and "PriorMatch" or "NextMatch"
  local dir_f = direction == MatchDirection.NEXT and "NextMatch" or "PriorMatch"
  return wezterm.action_callback(function(window, pane)
    local search_direction = wezterm.GLOBAL.pane_search_direction[tostring(pane)]
    if search_direction == SearchDirection.BACKWARD then
      window:perform_action(
        act.Multiple({
          act.CopyMode(dir_b),
          act.ClearSelection,
          act.CopyMode("ClearSelectionMode"),
        }),
        pane
      )
    elseif search_direction == SearchDirection.FORWARD then
      window:perform_action(
        act.Multiple({
          act.CopyMode(dir_f),
          act.ClearSelection,
          act.CopyMode("ClearSelectionMode"),
        }),
        pane
      )
    end
  end)
end

copy_mode.NextMatch = match(MatchDirection.NEXT)

copy_mode.PriorMatch = match(MatchDirection.PRIOR)

copy_mode.AcceptPattern = act.Multiple({
  act.CopyMode("AcceptPattern"),
  act.ClearSelection,
  act.CopyMode("ClearSelectionMode"),
})

copy_mode.ClearPattern = wezterm.action_callback(function(window, pane)
  wezterm.GLOBAL.pane_search_direction[tostring(pane)] = nil
  window:perform_action(
    act.Multiple({
      act.CopyMode("ClearPattern"),
      act.CopyMode("AcceptPattern"),
    }),
    pane
  )
end)

module.CopyMode = function(action)
  return copy_mode[tostring(action)]
end

return module
