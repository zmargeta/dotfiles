lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "monokai-pro"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.visual_mode["<leader-p>"] = "\"_dP"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "black" }
})
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.bufferline.options.mode = "tabs"
lvim.plugins = {
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    config = function ()
      require("monokai-pro").setup({
        styles = {
          comment = { italic = false },
          keyword = { italic = false },
          type = { italic = false },
          storageclass = { italic = false },
          structure = { italic = false },
          parameter = { italic = false },
          annotation = { italic = false },
          tag_attribute = { italic = false },
        },
        filter = "octagon",
      })
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false
        }
      })
    end
  },
  { "tpope/vim-surround" },
}
lvim.icons.git.Branch = ""
vim.opt.relativenumber = true

