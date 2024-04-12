vim.bo.expandtab = false

vim.keymap.set("n", "<leader>bt", ":lua require('dap-go').debug_test()<CR>", { desc = "Debug: Test" })
vim.keymap.set("n", "<leader>blt", ":lua require('dap-go').debug_last_test()<CR>", { desc = "Debug: Last Test" })
