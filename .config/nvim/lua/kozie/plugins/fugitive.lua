return {
    "tpope/vim-fugitive",
    enabled = false,
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
}
