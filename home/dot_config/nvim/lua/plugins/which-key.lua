return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      local which_key = require("which-key")
      local telescope_builtin = require("telescope.builtin")
      local telescope_extensions = require("telescope").extensions
      local harpoon = require("harpoon")
      local conform = require("conform")
      local lint = require("lint")
      local gitsigns = require("gitsigns")
      which_key.setup({})
      which_key.add({
        { "g", group = "Goto" },
        { "gd", telescope_builtin.lsp_definitions, desc = "Definition" },
        { "gD", vim.lsp.buf.declaration, desc = "Declaration" },
        { "gI", telescope_builtin.lsp_implementations, desc = "Implementations" },
        { "gT", telescope_builtin.lsp_type_definitions, desc = "Type definitions" },
        { "gr", telescope_builtin.lsp_references, desc = "References" },
        { "K", vim.lsp.buf.hover, desc = "Documentation" },
        { "]", group = "Next" },
        {
          "]c",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end,
          desc = "Git change",
        },
        { "]d", vim.diagnostic.goto_next, desc = "Diagnostic" },
        { "[", group = "Previous" },
        {
          "[c",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end,
          desc = "Git change",
        },
        { "[d", vim.diagnostic.goto_prev, desc = "Diagnostic" },
      }, {
        { "<leader>b", group = "Bookmarks" },
        {
          "<leader>ba",
          function()
            harpoon:list():add()
          end,
          desc = "Add harpoon bookmark",
        },
        {
          "<leader>bn",
          function()
            harpoon:list():next()
          end,
          desc = "Next harpoon bookmark",
        },
        {
          "<leader>bp",
          function()
            harpoon:list():prev()
          end,
          desc = "Prev harpoon bookmark",
        },
        { "<leader>e", telescope_extensions.file_browser.file_browser, desc = "File explorer" },
        { "<leader>f", group = "Find" },
        {
          "<leader>fb",
          function()
            local function finder()
              local file_paths = {}
              for _, item in ipairs(harpoon:list().items) do
                table.insert(file_paths, item.value)
              end
              return require("telescope.finders").new_table({ results = file_paths })
            end
            local telescope_config = require("telescope.config").values
            require("telescope.pickers")
              .new({}, {
                prompt_title = "Harpoon",
                finder = finder(),
                previewer = telescope_config.file_previewer({}),
                sorter = telescope_config.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, map)
                  map("i", "<BS>", function()
                    local state = require("telescope.actions.state")
                    local selected_entry = state.get_selected_entry()
                    local current_picker = state.get_current_picker(prompt_bufnr)
                    table.remove(harpoon:list().items, selected_entry.index)
                    current_picker:refresh(finder())
                  end)
                  return true
                end,
              })
              :find()
          end,
          desc = "Harpoon bookmarks",
        },
      })
      which_key.add({
        {
          "<leader>fc",
          function()
            telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "Config file",
        },
        { "<leader>fd", telescope_builtin.diagnostics, desc = "Diagnostic" },
        { "<leader>ff", telescope_builtin.find_files, desc = "File" },
        { "<leader>fg", telescope_builtin.grep_string, desc = "Word" },
        { "<leader>fh", telescope_builtin.help_tags, desc = "Help" },
        { "<leader>fk", telescope_builtin.keymaps, desc = "Keymap" },
        { "<leader>fl", telescope_builtin.live_grep, desc = "Live grep" },
        { "<leader>fp", telescope_extensions.project.project, desc = "Project" },
        { "<leader>fr", telescope_builtin.resume, desc = "Resume find" },
        { "<leader>fs", telescope_builtin.lsp_document_symbols, desc = "Document symbol" },
        { "<leader>fS", telescope_builtin.lsp_workspace_symbols, desc = "Workspace symbol" },
        { "<leader>ft", telescope_builtin.builtin, desc = "Telescope builtin" },
        {
          "<leader>f.",
          function()
            telescope_builtin.oldfiles({ only_cwd = true })
          end,
          desc = "Recent file",
        },
        {
          "<leader>f/",
          function()
            telescope_builtin.live_grep({
              grep_open_files = true,
              prompt_title = "Live grep in open files",
            })
          end,
          desc = "Grep in open files",
        },
        { "<leader>h", group = "Git" },
        { "<leader>hb", gitsigns.blame_line, desc = "Blame line" },
        { "<leader>hd", gitsigns.diffthis, desc = "Diff against index" },
        {
          "<leader>hD",
          function()
            gitsigns.diffthis("@")
          end,
          desc = "Diff against last commit",
        },
        { "<leader>hp", gitsigns.preview_hunk, desc = "Preview hunk" },
        { "<leader>hr", gitsigns.reset_hunk, desc = "Reset hunk" },
        { "<leader>hR", gitsigns.reset_buffer, desc = "Reset buffer" },
        { "<leader>hs", gitsigns.stage_hunk, desc = "Stage hunk" },
        { "<leader>hS", gitsigns.stage_buffer, desc = "Stage buffer" },
        { "<leader>hu", gitsigns.undo_stage_hunk, desc = "Undo stage hunk" },
        { "<leader>t", group = "Toggle" },
        { "<leader>tb", gitsigns.toggle_current_line_blame, desc = "Git current line blame" },
        { "<leader>td", gitsigns.toggle_deleted, desc = "Git deleted" },
        { "<leader>o", "<Cmd>Oil<CR>", desc = "Open parent directory" },
        { "<leader>r", group = "Refactor" },
        {
          "<leader>rf",
          function()
            conform.format({ async = true, lsp_fallback = true })
          end,
          desc = "Format buffer",
        },
        {
          "<leader>rl",
          function()
            lint.try_lint()
          end,
          desc = "Lint buffer",
        },
        { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
        { "<leader>r.", vim.lsp.buf.code_action, desc = "Open the code actions menu" },
        {
          "<leader>/",
          function()
            telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
              winbled = 10,
              previewer = false,
            }))
          end,
          desc = "Fuzzily find in current buffer",
        },
        { "<leader><leader>", telescope_builtin.buffers, desc = "Find buffer" },
      })
      which_key.add({
        mode = { "v" },
        { "<leader>h", group = "Git" },
        {
          "<leader>hr",
          function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Reset hunk",
        },
        {
          "<leader>hs",
          function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Stage hunk",
        },
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          which_key.add({
            { "<leader>t", group = "Toggle" },
            {
              "<leader>th",
              function()
                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                else
                  vim.notify("toggling inline hints is not supported", "error")
                end
              end,
              desc = "Inlay hints",
            },
          })
        end,
      })
    end,
  },
}
