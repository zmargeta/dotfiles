return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("oil").setup({
        default_file_explorer = false,
      })
      vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
