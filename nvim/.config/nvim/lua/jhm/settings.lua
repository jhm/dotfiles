vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3

local o = vim.opt

o.nu = true
o.relativenumber = true

o.mouse = "a"

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.wrap = false
o.tw = 80
o.colorcolumn = "100"
o.signcolumn = "yes"

o.scrolloff = 8

o.hlsearch = true
o.incsearch = true

o.termguicolors = true
o.joinspaces = true

o.cursorline = false
o.clipboard = "unnamedplus"

o.updatetime = 100
o.timeoutlen = 300

o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

local space = "."
o.list = true
o.listchars:append({ multispace = space })
o.listchars:append({ lead = space })
o.listchars:append({ trail = space })
o.listchars:append({ nbsp = space })
