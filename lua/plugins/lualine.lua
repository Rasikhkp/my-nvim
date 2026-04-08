return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Define custom colors for the "Bubbles" look
		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#d183e8",
			grey = "#303030",
		}

		require("lualine").setup({
			options = {
				theme = "auto", -- Pulls colors from your current colorscheme
				component_separators = "",
				section_separators = { left = "", right = "" },
				globalstatus = true, -- Single bar at the bottom for all windows
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"%=", -- Center alignment starts here
					{
						function()
							return "󰚀"
						end, -- Simple aesthetic icon
						color = { fg = colors.cyan },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " " },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
