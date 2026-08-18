return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.5 },
                            { id = "breakpoints", size = 0.15 },
                            { id = "stacks", size = 0.2 },
                            { id = "watches", size = 0.15 },
                        },
                        size = 60,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 0.25,
                        position = "bottom",
                    },
                },
            })

            -- Auto open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

            -- Python adapter (debugpy)
            dap.adapters.python = {
                type = 'server',
                host = '127.0.0.1',
                port = 5679,
            }

            dap.configurations.python = {
                {
                    name = "Attach Playback",
                    type = "python",
                    request = "attach",
                    connect = { host = "127.0.0.1", port = 5679 },
                    pathMappings = {
                        { localRoot = vim.fn.getcwd(), remoteRoot = vim.fn.getcwd() },
                    },
                },
            }

            -- Keymaps
            vim.keymap.set('n', '<F5>', function() dap.continue() end)
            vim.keymap.set('n', '<F6>', function() dap.step_over() end)
            vim.keymap.set('n', '<F7>', function() dap.step_into() end)
            vim.keymap.set('n', '<F8>', function() dap.step_out() end)
            vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        end
    },
}
