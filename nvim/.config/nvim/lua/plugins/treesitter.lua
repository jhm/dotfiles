return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"go",
			"javascript",
			"lua",
			"query",
			"rust",
			"sql",
			"typescript",
			"vim",
			"vimdoc",
		},
		highlight = { enable = true },
		indent = { enable = true },
		sync_install = false,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
