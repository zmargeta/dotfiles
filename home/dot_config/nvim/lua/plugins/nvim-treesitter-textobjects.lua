return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter or argument" },
            ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["am"] = { query = "@function.outer", desc = "Select outer part of a method or function definition" },
            ["at"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter or argument" },
            ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
            ["im"] = { query = "@function.inner", desc = "Select inner part of a method or function definition" },
            ["it"] = { query = "@class.inner", desc = "Select inner part of a class" },
            ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>n:"] = { query = "@property.outer", desc = "Swap next object property" },
            ["<leader>na"] = { query = "@parameter.inner", desc = "Swap next parameter or argument" },
            ["<leader>nm"] = { query = "@function.outer", desc = "Swap next method or function" },
          },
          swap_previous = {
            ["<leader>p:"] = { query = "@property.outer", desc = "Swap previous object property" },
            ["<leader>pa"] = { query = "@parameter.inner", desc = "Swap previous parameter or argument" },
            ["<leader>pm"] = { query = "@function.outer", desc = "Swap previous method or function" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
            ["]m"] = { query = "@function.outer", desc = "Next method or function definition start" },
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]t"] = { query = "@class.outer", desc = "Next class start" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = { query = "@call.outer", desc = "Next function call end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            ["]M"] = { query = "@function.outer", desc = "Next method or function definition end" },
            ["]T"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@call.outer", desc = "Previous function call start" },
            ["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
            ["[m"] = { query = "@function.outer", desc = "Previous method or function definition start" },
            ["[t"] = { query = "@class.outer", desc = "Previous class start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@call.outer", desc = "Previous function call end" },
            ["[I"] = { query = "@conditional.outer", desc = "Previous conditional end" },
            ["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
            ["[M"] = { query = "@function.outer", desc = "Previous method or function definition end" },
            ["[T"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
      },
    })
  end,
}
