return {
	"rebelot/kanagawa.nvim",
	init = function()
		vim.cmd([[
            colorscheme kanagawa
            hi StatusLine guifg=#222222 guibg=#869AD5
            hi StatusLineNC guifg=#222222 guibg=#FF9999
        ]])
	end,
}
