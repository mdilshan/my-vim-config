return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "master",
        lazy = false,
        config = function()
            -- Ensure parsers install to a persistent path
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            for _, config in pairs(parser_config) do
                config.install_info.install_dir = vim.fn.stdpath("data") .. "/site"
            end

            -- Make Neovim recognize `.handlebars` extension
            vim.filetype.add({
                extension = {
                    handlebars = "handlebars",
                },
            })

            local parsers = require("nvim-treesitter.parsers")
            -- Tell Treesitter: use the HTML parser for Handlebars
            parsers.get_parser_configs().html.used_by = { "handlebars" }

            require("nvim-treesitter.configs").setup({
                -- ensure_installed = {
                --     "javascript", "typescript", "c", "rust", "lua", "vim", "vimdoc", "query"
                -- },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = false,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
