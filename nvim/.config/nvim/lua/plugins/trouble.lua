return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			icons = false,
		})
	end,
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" },
	},
}
