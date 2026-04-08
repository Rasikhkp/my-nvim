-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation (important for JS/TS)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Scrolling
vim.opt.scrolloff = 8

-- Better splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Clipboard (VERY IMPORTANT)
vim.opt.clipboard = "unnamedplus"

-- Faster updates
vim.opt.updatetime = 250

-- Disable swap (optional)
vim.opt.swapfile = false

vim.opt.fillchars = {
	eob = " ", -- empty lines at end of buffer
	vert = "│", -- vertical separator for splits
	fold = " ", -- folded lines
	diff = "░", -- diff filler
}
