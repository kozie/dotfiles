return {
    "mistricky/codesnap.nvim",
    build = "make",
    event = "VeryLazy",
    keys = {
        { "<leader>cc", ":CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>cs", ":CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    config = function()
        require("codesnap").setup({
            has_line_number = true,
            has_breadcrumbs = true,
            watermark = "Kozie's Excellent Code Examples",
        })
    end
}
