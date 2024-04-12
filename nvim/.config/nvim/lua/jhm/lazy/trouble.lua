return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			icons = false,
		})
	end,
	keys = {
		{ "<leader>tt", "<cmd>TroubleToggle<cr>" },
		{ "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>" },
		{ "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
		{ "<leader>tl", "<cmd>TroubleToggle loclist<cr>" },
		{ "<leader>tq", "<cmd>TroubleToggle quickfix<cr>" },
	},
}
