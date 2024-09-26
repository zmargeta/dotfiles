vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Stop highlighting" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the upper window" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Go to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Go to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Go to the upper window" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Repeat /?" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Repeat /? opposite direction" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank end of line" })
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("zmargeta", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
