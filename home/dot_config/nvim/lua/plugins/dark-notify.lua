return {
  {
    "cormacrelf/dark-notify",
    lazy = false,
    priority = 5000,
    config = function()
      require("dark_notify").run({})
    end,
  },
}
