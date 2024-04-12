return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>p", "<cmd>Telescope find_files<cr>" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
		{ "<leader>fq", "<cmd>Telescope quickfix<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fc", "<cmd>Telescope command_history<cr>" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
	},
}
