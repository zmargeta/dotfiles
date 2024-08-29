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
        { "g", group = "goto" },
        { "gd", telescope_builtin.lsp_definitions, desc = "Goto definition" },
        { "gD", vim.lsp.buf.declaration, desc = "Goto declaration" },
        { "gI", telescope_builtin.lsp_implementations, desc = "Goto implementations" },
        { "gT", telescope_builtin.lsp_type_definitions, desc = "Goto type definition" },
        { "gr", telescope_builtin.lsp_references, desc = "Goto references" },
        { "K", vim.lsp.buf.hover, desc = "Show documentation" },
        { "]", group = "next" },
        {
          "]c",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end,
          desc = "Next git change",
        },
        { "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },
        { "[", group = "previous" },
        {
          "[c",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end,
          desc = "Previous git change",
        },
        { "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
      }, {
        { "<leader>b", group = "bookmarks" },
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
          desc = "Previous harpoon bookmark",
        },
        { "<leader>e", telescope_extensions.file_browser.file_browser, desc = "File explorer" },
        { "<leader>f", group = "find" },
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
          desc = "Find harpoon bookmarks",
        },
      })
      which_key.add({
        {
          "<leader>fc",
          function()
            telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "Find config file",
        },
        { "<leader>fd", telescope_builtin.diagnostics, desc = "Find diagnostic" },
        { "<leader>ff", telescope_builtin.find_files, desc = "Find file" },
        { "<leader>fg", telescope_builtin.grep_string, desc = "Find word" },
        { "<leader>fh", telescope_builtin.help_tags, desc = "Find help" },
        { "<leader>fk", telescope_builtin.keymaps, desc = "Find keymap" },
        { "<leader>fl", telescope_builtin.live_grep, desc = "Find by live grep" },
        { "<leader>fp", telescope_extensions.project.project, desc = "Find project" },
        { "<leader>fr", telescope_builtin.resume, desc = "Resume find" },
        { "<leader>fs", telescope_builtin.lsp_document_symbols, desc = "Find document symbol" },
        { "<leader>fS", telescope_builtin.lsp_workspace_symbols, desc = "Find workspace symbol" },
        { "<leader>ft", telescope_builtin.builtin, desc = "Find telescope builtin" },
        {
          "<leader>f.",
          function()
            telescope_builtin.oldfiles({ only_cwd = true })
          end,
          desc = "Find recent file",
        },
        {
          "<leader>f/",
          function()
            telescope_builtin.live_grep({
              grep_open_files = true,
              prompt_title = "Live grep in open files",
            })
          end,
          desc = "Find by grep in open files",
        },
        { "<leader>h", group = "git" },
        { "<leader>hb", gitsigns.blame_line, desc = "Git blame line" },
        { "<leader>hd", gitsigns.diffthis, desc = "Git diff against index" },
        {
          "<leader>hD",
          function()
            gitsigns.diffthis("@")
          end,
          desc = "Git diff against last commit",
        },
        { "<leader>hp", gitsigns.preview_hunk, desc = "Git preview hunk" },
        { "<leader>hr", gitsigns.reset_hunk, desc = "Git reset hunk" },
        { "<leader>hR", gitsigns.reset_buffer, desc = "Git reset buffer" },
        { "<leader>hs", gitsigns.stage_hunk, desc = "Git stage hunk" },
        { "<leader>hS", gitsigns.stage_buffer, desc = "Git stage buffer" },
        { "<leader>hu", gitsigns.undo_stage_hunk, desc = "Git undo stage hunk" },
        { "<leader>t", group = "toggle" },
        { "<leader>tb", gitsigns.toggle_current_line_blame, desc = "Toggle show git current line blame" },
        { "<leader>td", gitsigns.toggle_deleted, desc = "Toggle show git deleted" },
        { "<leader>o", "<Cmd>Oil<CR>", desc = "Open parent directory" },
        { "<leader>r", group = "refactor" },
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
        { "<leader>h", group = "git" },
        {
          "<leader>hr",
          function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Git reset hunk",
        },
        {
          "<leader>hs",
          function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          desc = "Git stage hunk",
        },
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          which_key.add({
            { "<leader>t", group = "toggle" },
            {
              "<leader>th",
              function()
                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                else
                  vim.notify("toggling inline hints is not supported", "error")
                end
              end,
              desc = "Toggle show inlay hints",
            },
          })
        end,
      })
    end,
  },
}
