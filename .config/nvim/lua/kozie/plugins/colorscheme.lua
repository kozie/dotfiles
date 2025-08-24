return {
	"rose-pine/neovim",
	name = "rose-pine",
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

		vim.cmd("colorscheme rose-pine-moon")
	end
}
--[[
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
        require"catppuccin".setup({
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            transparent_background = true, -- disables setting the background color.
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },

            vim.cmd.colorscheme "catppuccin"
        })
    end
}
]]
