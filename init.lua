-- Install package managem
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Add plugins
require('lazy').setup({
	'mcchrish/zenbones.nvim',
	'rktjmp/lush.nvim',
	'mfussenegger/nvim-jdtls',       --jdtls
	'MunifTanjim/prettier.nvim',     --prettier
	'jose-elias-alvarez/null-ls.nvim', --null-ls
	'mattn/emmet-vim',               --emmet
	'neovim/pynvim',                 --python support
	'windwp/nvim-autopairs',         --autoclose
	'puremourning/vimspector',       -- for debugging
	'williamboman/nvim-lsp-installer',
	'weirongxu/plantuml-previewer.vim', -- PlantUML previewer
	'tyru/open-browser.vim',         -- Open browser
	'nvim-tree/nvim-web-devicons',   --nvim tree icons
	'pechorin/any-jump.vim',         -- any-jump
	'aklt/plantuml-syntax',          --plantUML syntax
	'AlexvZyl/nordic.nvim',          -- nordic
	'Mofiqul/vscode.nvim',           -- vscode
	'sainnhe/gruvbox-material',      -- gruvbox
	'tpope/vim-fugitive',            -- Git commands in nvim
	'tpope/vim-rhubarb',             -- Fugitive-companion to interact with github
	'numToStr/Comment.nvim',         -- "gc" to comment visual regions/lines
	'nvim-tree/nvim-tree.lua',       -- tree
	'navarasu/onedark.nvim',         -- Colorscheme
	'nvim-lualine/lualine.nvim',     -- Fancier statusline
	-- Add git related info in the signs columns and popups
	'lewis6991/gitsigns.nvim',
	'nvim-treesitter/nvim-treesitter',          -- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter-textobjects', -- Additional textobjects for treesitter
	'neovim/nvim-lspconfig',                    -- Collection of configurations for built-in LSP client
	'williamboman/mason.nvim',                  -- Automatically install LSPs to stdpath for neovim
	'williamboman/mason-lspconfig.nvim',        -- ibid
	'folke/neodev.nvim',                        -- Lua language server configuration for nvim
	{                                           -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},
	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		-- NOTE: If you have trouble with this installation, refer to the README for telescope-fzf-native.
		build = 'make',
	},
	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	-- Live server
	{
		'barrett-ruth/live-server.nvim',
		build = 'npm add -g live-server',
		cmd = { 'LiveServerStart', 'LiveServerStop' },
		config = true
	},
	-- terminal
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true
	}
}, {})

-- nowrap
vim.o.wrap = false

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Set shiftwidth
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd.colorscheme 'zenbones'

--Set statusbar
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'gruvbox-material',
		component_separators = '|',
		section_separators = '',
	},
}

-- cursorline
vim.o.cursorline = true

-- Map anyjump to ctrl+j
vim.keymap.set('n', '<C-j>', function() vim.cmd.AnyJump() end)

--Enable Comment.nvim
require('Comment').setup()

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- turn on toggleterm
require("toggleterm").setup {}
vim.keymap.set('n', '<C-o>', [[<Cmd>TermExec cmd="fish" go_back=0<Cr>]])

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
	on_attach = function(bufnr)
		vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
		vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
	end,
}

-- Telescope
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}

-- Nvim tree
require('nvim-tree').setup()
vim.keymap.set('n', '<C-n>', function() vim.cmd.NvimTreeOpen() end)

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', function() require('telescope.builtin').buffers { sort_lastused = true } end)
vim.keymap.set('n', '<C-t>', function() require('telescope.builtin').find_files { previewer = true } end)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
	auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<M-space>',
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}


-- Diagnostic settings
vim.diagnostic.config {
	virtual_text = false,
	update_in_insert = true,
}

-- Diagnostic keymaps
vim.keymap.set('n', 'K', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setqflist)

-- LSP settings
require('mason').setup {}
require('mason-lspconfig').setup {
	ensure_installed = { 'jdtls', 'pyright', 'lemminx', 'tsserver', 'html' }
}

-- Add nvim-lspconfig plugin
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
	vim.keymap.set('n', 'H', vim.lsp.buf.hover, attach_opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
	vim.keymap.set('n', 'S', vim.lsp.buf.signature_help, attach_opts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
	vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
		attach_opts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
	vim.keymap.set('n', '<C-r><C-n>', vim.lsp.buf.rename, attach_opts)
	vim.keymap.set('n', '<C-f>', vim.lsp.buf.format, attach_opts)
	vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'jdtls', 'pyright', 'lemminx', 'tsserver', 'html' }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

require('neodev').setup {}

lspconfig.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = 'Replace',
			},
		},
	},
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<Tab>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<C-n>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-p>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	},
}

-- Autopairs
require('nvim-autopairs').setup {}
-- vim: ts=2 sts=2 sw=2 et


local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<Leader>f", function()
				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
			end, { buffer = bufnr, desc = "[lsp] format" })
		end
	end,
})

local prettier = require("prettier")

prettier.setup({
	bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		arrow_parens = "always",
		bracket_spacing = true,
		bracket_same_line = false,
		embedded_language_formatting = "auto",
		end_of_line = "lf",
		html_whitespace_sensitivity = "css",
		-- jsx_bracket_same_line = false,
		jsx_single_quote = false,
		print_width = 80,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = true,
		single_attribute_per_line = false,
		single_quote = false,
		tab_width = 2,
		trailing_comma = "es5",
		use_tabs = false,
		vue_indent_script_and_style = false,
	},
}
