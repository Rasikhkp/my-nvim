-- Leader key
vim.g.mapleader = " "

local map = vim.keymap.set

-- ======================
-- General
-- ======================

-- Better escape
map("i", "jk", "<Esc>")

-- Save & quit
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlight" })

-- Reload config
map("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>", { desc = "Reload config" })

-- Make split
map("n", "<leader>v", "<C-w>v") -- vertical split
map("n", "<leader>s", "<C-w>s") -- horizontal split

-- ======================
-- Editing improvements
-- ======================

-- Move lines up/down (visual mode)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Toggle text wrap
map("n", "<leader><leader>w", ":set wrap!<CR>", { desc = "Toggle text wrap" })

-- ======================
-- Telescope
-- ======================

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Choose colorscheme" })

-- ======================
-- Oil
-- ======================

map("n", "<leader>o", ":Oil --float<CR>", { desc = "Oil explorer" })

-- ======================
-- Toggleterm
-- ======================

map("n", "<A-i>", "<cmd>ToggleTerm<CR>")
map("t", "<A-i>", "<cmd>ToggleTerm<CR>")
map("t", "jk", "<C-\\><C-n>")

-- ======================
-- Spectre
-- ======================

map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
map(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word" }
)
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search selection" })
map(
	"n",
	"<leader>sp",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	{ desc = "Search in current file" }
)
