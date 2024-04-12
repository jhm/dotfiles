return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_setup = true,
			handlers = {},
			ensure_installed = {
				"delve",
			},
		})

		vim.keymap.set("n", "<f1>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<f2>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<f3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<f5>", dap.continue, { desc = "Debug: Continue" })
		vim.keymap.set("n", "<leader>br", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>bc", dap.clear_breakpoints, { desc = "Debug: Clear Breakpoints" })

		vim.keymap.set("n", "<f7>", dapui.toggle, { desc = "Debug: See last session result" })
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		dapui.setup()

		-- Install golang specific config
		require("dap-go").setup()

		--vim.api.nvim_create_autocmd({"go"}
	end,
}
