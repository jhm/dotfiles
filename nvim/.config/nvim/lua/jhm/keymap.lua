vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set("n", "<leader>w", ":w<CR>")
set("n", "<Esc>", "<cmd>nohlsearch<CR>")
set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- I'm going to disable these for a few days and try the defaults
-- k.set("n", "<C-h>", "<C-w>h")
-- k.set("n", "<C-j>", "<C-w>j")
-- k.set("n", "<C-k>", "<C-w>k")
-- k.set("n", "<C-l>", "<C-w>l")

set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(e)
		local opts = { buffer = e.buf }
		set("n", "gd", vim.lsp.buf.definition, opts)
		set("n", "gD", vim.lsp.buf.declaration, opts)
		set("n", "K", vim.lsp.buf.hover, opts)
		set("n", "gi", vim.lsp.buf.implementation, opts)
		set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		set("n", "<leader>e", vim.diagnostic.open_float)
		set("n", "<leader>cr", vim.lsp.buf.rename, opts)
		set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		set("n", "<leader>cf", vim.lsp.buf.format)
	end,
})
