vim.g.mapleader = " "

-- format python code
vim.keymap.set("n", "F", "<cmd>!black %<cr><cr>")
-- vim.keymap.set("n", "F", "<cmd>wr !black - --quite%<cr><cr>")
-- vim.cmd[[ autocmd BufWritePost <buffer> python "!black %" ]]
-- vim.cmd [[ autocmd BufWritePre <buffer> python "w !black -" ]]

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
