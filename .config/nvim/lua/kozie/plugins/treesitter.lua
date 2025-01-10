return {
	'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    },
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

        require'treesitter-context'.setup{
            enable = true,
        }

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }
	end
}

