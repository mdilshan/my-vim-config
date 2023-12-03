vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>pv", ":lua vim.cmd[[Ex]]<CR>", { noremap = true, silent = true })

