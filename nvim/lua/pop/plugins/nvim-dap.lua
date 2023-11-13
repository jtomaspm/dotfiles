return {
    'mfussenegger/nvim-dap',
    config = function ()

        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
        keymap.set("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Start or Continue" })
    end
}
