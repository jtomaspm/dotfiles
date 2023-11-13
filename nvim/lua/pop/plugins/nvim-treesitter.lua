return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        vim.cmd "TSUpdate"

        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query"},
            ignore_install = {""},
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                disable = {""},
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true, disable={""} }
        }
    end
}
