return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_type = {
      javascript = { "eslint_d" },
      lua = { "luacheck" },
      python = { "pylint" },
    }
  end,
}
