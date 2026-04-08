return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
			ensure_installed = { "javascript", "typescript", "tsx", "html", "css" },
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		})
	end,
}
