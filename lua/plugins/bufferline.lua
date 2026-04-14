return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",

	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },

		-- safer delete (no plugin dependency)
		{ "<leader>bd", "<cmd>bd<CR>", desc = "Delete buffer" },
		{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },
		{ "<leader>bP", "<cmd>BufferLinePickClose<CR>", desc = "Pick close buffer" },
		{
			"<leader>bo",
			function()
				local current = vim.api.nvim_get_current_buf()

				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					if bufnr ~= current and vim.api.nvim_buf_is_loaded(bufnr) then
						local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")

						-- skip special buffers like terminal
						if buftype == "" then
							vim.cmd("bd " .. bufnr)
						end
					end
				end
			end,
			desc = "Close all buffers except current",
		},

		-- FIXED directions
		{ "[b", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
		{ "]b", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
	},

	opts = function()
		local ok, bufferline = pcall(require, "bufferline")
		if not ok then
			return {}
		end

		return {
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.default,

				themable = true,
				numbers = "none",

				close_command = "bd %d",
				right_mouse_command = "bd %d",
				left_mouse_command = "buffer %d",

				indicator = {
					icon = "▎",
					style = "icon",
				},

				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "󰅖",

				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 18,

				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,

				-- FIXED indicator
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or level:match("warning") and " " or " "
					return icon .. count
				end,

				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},

				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,

				persist_buffer_sort = true,
				move_wraps_at_ends = false,

				separator_style = "thick",
				enforce_regular_tabs = false,
				always_show_bufferline = true,

				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},

				sort_by = "insert_after_current",
			},
		}
	end,
}
