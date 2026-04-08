return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- lazy load on save
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n", "v" },
      desc = "Format file",
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
