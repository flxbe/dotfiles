-- Set SPACE as the leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", "<C-w>")
