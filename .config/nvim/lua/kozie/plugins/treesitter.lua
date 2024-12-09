return {
	'nvim-treesitter/nvim-treesitter',
	event = { 'BufReadPre', 'BufNewFile' },
	build = ':TSUpdate',
	config = function()
		local treesitter = require('nvim-treesitter.configs')

		treesitter.setup({
            sync_install = false,
            auto_install = true,
			highlight = {
				enable = true,
                additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			ensure_installed = {
				'json',
				'javascript',
				'yaml',
				'html',
				'css',
                'php',
				'markdown',
				'markdown_inline',
				'bash',
				'lua',
				'vim',
				'dockerfile',
				'gitignore',
				'query',
				'vimdoc',
			},
		})
	end
}

