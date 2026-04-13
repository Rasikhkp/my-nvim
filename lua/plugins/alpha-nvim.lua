return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			" ",
			"  _   _             _   _ _ ",
			" | \\ | | ___  _____   _(_)_ __ ___ ",
			" |  \\| |/ _ \\/ _ \\ \\ / / | '_ ` _ \\ ",
			" | |\\  |  __/ (_) \\ V /| | | | | | |",
			" |_| \\_|\\___|\\___/ \\_/ |_|_| |_| |_|",
			" ",
			"              I just want coffee ☕️.",
			" ",
		}

		-- ======================
		-- BUTTONS
		-- ======================
		dashboard.section.buttons.val = {
			dashboard.button("f", "🔭  Find file", ":Telescope find_files<CR>"),
			dashboard.button("e", "📄  New file", ":ene<CR>"),
			dashboard.button("r", "📑  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("g", "🔎  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("c", "⚙️  Config", ":e ~/.config/nvim/init.lua<CR>"),
			dashboard.button("q", "⛔️  Quit", ":qa<CR>"),
		}

		-- ======================
		-- FOOTER
		-- ======================
		local function footer()
			local datetime = os.date(" %d-%m-%Y   %H:%M")
			local version = vim.version()
			local nvim_version = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
			return datetime .. nvim_version
		end

		dashboard.section.footer.val = footer()

		-- ======================
		-- STYLE
		-- ======================
		dashboard.section.header.opts.hl = "Type"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.section.footer.opts.hl = "Comment"

		dashboard.opts.layout = {
			{ type = "padding", val = 4 },
			dashboard.section.header,
			{ type = "padding", val = 0 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		-- Disable folding on alpha buffer
		alpha.setup(dashboard.opts)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
