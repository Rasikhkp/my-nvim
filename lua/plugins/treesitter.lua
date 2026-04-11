return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		local ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"json",
			"bash",
			"markdown",
		}

		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end,
}
