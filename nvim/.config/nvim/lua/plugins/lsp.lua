return {
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = true,
		branch = "v3.x",
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{
				"L3MON4D3/LuaSnip",
				lazy = false,
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		config = function()
			-- Configure autocompletion
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", keyword_length = 1 },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "nvim_lua" },
				}),
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
		config = function()
			-- Configure LSP
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
				vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<f4>", vim.lsp.buf.code_action, opts)
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {
					"eslint",
					"gopls",
					"lua_ls",
					"pyright",
					"tsserver",
					"rust_analyzer",
				},
				handlers = { lsp_zero.default_setup },
			})

			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.stylua,
				},
			})

			lsp_zero.format_mapping("<F3>", {
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = {
						"css",
						"go",
						"html",
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"lua",
						"markdown",
						"markdown.mdx",
						"python",
						"typescript",
						"typescriptreact",
						"vue",
					},
				},
			})
		end,

		-- Set to debug when debugging is necessary and off for normal usage.
		vim.lsp.set_log_level("off"),
	},
}
