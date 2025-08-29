return {
    --[[ Rose pine
	"rose-pine/neovim",
	name = "rose-pine",
    init = function()
        vim.cmd.colorscheme "rose-pine-moon"
    end,
	priority = 1000,
	config = function()
        require"rose-pine".setup({
            enable = {
                terminal = true,
            },
            styles = {
                italic = true,
                transparency = true,
            },
            disable_italics = false,
        })
	end, ]]

    -- Catppuccin
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme "catppuccin"
    end,
    config = function ()
        require"catppuccin".setup({
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            transparent_background = true,
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = { "italic" },
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
        })
    end,
}
