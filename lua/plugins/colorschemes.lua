return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("tokyonight").setup({
    --             style = "night",
    --             transparent = true,
    --         })
    --         -- vim.cmd("colorscheme tokyonight")
    --     end,
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     name = "kanagawa",
    --     config = function()
    --         require("kanagawa").setup({
    --             transparent = true,
    --         })
    --         vim.cmd("colorscheme kanagawa")
    --     end,
    -- }
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    transparency = true,
                }
            })
            vim.cmd("colorscheme rose-pine")
        end,
    },
}
