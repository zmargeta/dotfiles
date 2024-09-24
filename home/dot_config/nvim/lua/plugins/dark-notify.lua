return {
  {
    "cormacrelf/dark-notify",
    lazy = false,
    priority = 100,
    config = function()
      require("dark_notify").run({})
    end,
  },
}
