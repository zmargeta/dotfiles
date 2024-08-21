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
      which_key.register({
        g = {
          name = "+goto",
          d = { telescope_builtin.lsp_definitions, "Goto definition" },
          D = { vim.lsp.buf.declaration, "Goto declaration" },
          I = { telescope_builtin.lsp_implementations, "Goto implementations" },
          T = { telescope_builtin.lsp_type_definitions, "Goto type definition" },
          r = { telescope_builtin.lsp_references, "Goto references" },
        },
        K = { vim.lsp.buf.hover, "Show documentation" },
        ["]"] = {
          name = "+next",
          c = {
            function()
              if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
              else
                gitsigns.nav_hunk("next")
              end
            end,
            "Next git change",
          },
          d = { vim.diagnostic.goto_next, "Next diagnostic" },
        },
        ["["] = {
          name = "+previous",
          c = {
            function()
              if vim.wo.diff then
                vim.cmd.normal({ "]c", bang = true })
              else
                gitsigns.nav_hunk("prev")
              end
            end,
            "Previous git change",
          },
          d = { vim.diagnostic.goto_prev, "Previous diagnostic" },
        },
      })
      which_key.register({
        b = {
          name = "+bookmarks",
          a = {
            function()
              harpoon:list():add()
            end,
            "Add harpoon bookmark",
          },
          n = {
            function()
              harpoon:list():next()
            end,
            "Next harpoon bookmark",
          },
          p = {
            function()
              harpoon:list():prev()
            end,
            "Previous harpoon bookmark",
          },
        },
        e = { telescope_extensions.file_browser.file_browser, "File explorer" },
        f = {
          name = "+find",
          b = {
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
            "Find harpoon bookmarks",
          },
          c = {
            function()
              telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end,
            "Find config file",
          },
          d = { telescope_builtin.diagnostics, "Find diagnostic" },
          f = { telescope_builtin.find_files, "Find file" },
          g = { telescope_builtin.grep_string, "Find word" },
          h = { telescope_builtin.help_tags, "Find help" },
          k = { telescope_builtin.keymaps, "Find keymap" },
          l = { telescope_builtin.live_grep, "Find by live grep" },
          p = { telescope_extensions.project.project, "Find project" },
          r = { telescope_builtin.resume, "Resume find" },
          s = { telescope_builtin.lsp_document_symbols, "Find document symbol" },
          S = { telescope_builtin.lsp_workspace_symbols, "Find workspace symbol" },
          t = { telescope_builtin.builtin, "Find telescope builtin" },
          ["."] = {
            function()
              telescope_builtin.oldfiles({ only_cwd = true })
            end,
            "Find recent file",
          },
          ["/"] = {
            function()
              telescope_builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live grep in open files",
              })
            end,
            "Find by grep in open files",
          },
        },
        h = {
          name = "+git",
          b = { gitsigns.blame_line, "Git blame line" },
          d = { gitsigns.diffthis, "Git diff against index" },
          D = {
            function()
              gitsigns.diffthis("@")
            end,
            "Git diff against last commit",
          },
          p = { gitsigns.preview_hunk, "Git preview hunk" },
          r = { gitsigns.reset_hunk, "Git reset hunk" },
          R = { gitsigns.reset_buffer, "Git reset buffer" },
          s = { gitsigns.stage_hunk, "Git stage hunk" },
          S = { gitsigns.stage_buffer, "Git stage buffer" },
          u = { gitsigns.undo_stage_hunk, "Git undo stage hunk" },
        },
        t = {
          name = "+toggle",
          b = { gitsigns.toggle_current_line_blame, "Toggle show git current line blame" },
          d = { gitsigns.toggle_deleted, "Toggle show git deleted" },
        },
        o = { "<Cmd>Oil<CR>", "Open parent directory" },
        r = {
          name = "+refactor",
          f = {
            function()
              conform.format({ async = true, lsp_fallback = true })
            end,
            "Format buffer",
          },
          l = {
            function()
              lint.try_lint()
            end,
            "Lint buffer",
          },
          n = { vim.lsp.buf.rename, "Rename" },
          ["."] = { vim.lsp.buf.code_action, "Open the code actions menu" },
        },
        ["/"] = {
          function()
            telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
              winbled = 10,
              previewer = false,
            }))
          end,
          "Fuzzily find in current buffer",
        },
        ["<leader>"] = { telescope_builtin.buffers, "Find buffer" },
      }, { prefix = "<leader>" })
      which_key.register({
        h = {
          r = {
            function()
              gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            "Git reset hunk",
          },
          s = {
            function()
              gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            "Git stage hunk",
          },
        },
      }, { mode = "v", prefix = "<leader>" })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          which_key.register({
            t = {
              h = {
                function()
                  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                  else
                    vim.notify("toggling inline hints is not supported", "error")
                  end
                end,
                "Toggle show inlay hints",
              },
            },
          }, { prefix = "<leader>" })
        end,
      })
    end,
  },
}
