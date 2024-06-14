return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local harpoon = require("harpoon")
      local telescope_config = require("telescope.config").values
      harpoon.setup({})
      vim.keymap.set("n", "<leader>sh", function()
        local function finder()
          local file_paths = {}
          for _, item in ipairs(harpoon:list().items) do
            table.insert(file_paths, item.value)
          end
          return require("telescope.finders").new_table({ results = file_paths })
        end
        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = finder(),
            previewer = telescope_config.file_previewer({}),
            sorter = telescope_config.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, map)
              map("i", "<C-x>", function()
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
      end, { desc = "[S]earch [H]arpoon" })
      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "[H]arpoon [A]dd" })
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end, { desc = "[H]arpoon [P]revious" })
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end, { desc = "[H]arpoon [N]ext" })
    end,
  },
}
