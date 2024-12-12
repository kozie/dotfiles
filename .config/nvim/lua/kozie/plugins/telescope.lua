return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
	config = function()
        local telescope = require("telescope")
		local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                path_display = { "smart" },
            }
        })

        telescope.load_extension("fzf")

		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Fuzzy find files in cwd' })
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags)
        vim.keymap.set('n', '<leader>pm', builtin.man_pages)
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Fuzzy find git files' })
        vim.keymap.set('n', '<Tab>', builtin.buffers)
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end)
	end,
}
