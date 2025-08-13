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
