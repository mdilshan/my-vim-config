return {
    {
        'tpope/vim-commentary',
        config = function()
            vim.api.nvim_set_keymap('x', '<leader>c', 'gc', { noremap = true, silent = true })
        end
    },
}

