return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        nix = { "nixfmt" },
        python = { "isort", "black" },
      },
    },
  },
}
