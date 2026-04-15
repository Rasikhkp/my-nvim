return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					position = "float",
					source = "filesystem",
				})
			end,
			desc = "Toggle Floating File Explorer",
		},
		{
			"<leader>re",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					position = "float",
					source = "filesystem",
					reveal = true, -- 👈 THIS is the key
				})
			end,
			desc = "Explorer (current file)",
		},
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",

		enable_git_status = true,
		enable_diagnostics = true,

		filesystem = {
			filtered_items = {
				visible = false, -- hide dotfiles by default
				hide_dotfiles = true,
				hide_gitignored = true,
			},
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},

		window = {
			position = "float",
			width = 40,
			mappings = {
				["<space>"] = "none",
				["<cr>"] = "open",
				["l"] = "open",
				["h"] = "close_node",
				["v"] = "open_vsplit",
				["s"] = "open_split",
				["t"] = "open_tabnew",
				["q"] = "close_window",
				["R"] = "refresh",
			},
		},

		default_component_configs = {
			indent = {
				indent_size = 2,
				padding = 1,
			},
			git_status = {
				symbols = {
					added = "✚",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
		},
	},
}
