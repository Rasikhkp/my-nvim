return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      win_options = {
        number = true,
        relativenumber = true,
        wrap = false,
      },
      win_split = "floating",
    },
    float = {
      max_height = 0.8,  -- 80% of screen height
      max_width = 0.8,   -- 80% of screen width
      border = "rounded", -- border style: "rounded", "double", "single", etc.
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
