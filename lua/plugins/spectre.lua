return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"nvim-tree/nvim-web-devicons", -- optional, for icons
	},
	config = function()
		require("spectre").setup({
			default = {
				replace = {
					cmd = "sed",
				},
			},
		})
	end,
}
