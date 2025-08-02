return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio'
        },
        config = function()
            local dap = require("dap")

            -- Debug adapter
            dap.adapters.node2 = {
                type = 'executable',
                command = 'node',
                args = {
                    os.getenv("HOME") .. '/.local/share/nvim/dap_adapters/js-debug/out/src/nodeDebug.js'
                }
            }

            dap.configurations.typescript = {
                name = "Attach to NX Serve",
                type = "node2",
                request = "attach",
                port = 9229,
                restart = true,
                sourceMaps = true,
                outFiles = {
                    "${workspaceFolder}/dist/**/*.js"
                }
            }

            -- Keymaps
            vim.keymap.set('n', '<F5>', function() dap.continue() end)
            vim.keymap.set('n', '<F10>', function() dap.step_over() end)
            vim.keymap.set('n', '<F11>', function() dap.step_into() end)
            vim.keymap.set('n', '<F12>', function() dap.step_out() end)
            vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        end
    },
}

