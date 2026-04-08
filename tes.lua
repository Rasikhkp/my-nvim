for _, client in ipairs(vim.lsp.get_active_clients()) do
  print(client.name)
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config["ts_ls"].capabilities = capabilities


print(vim.inspect(vim.lsp.config["ts_ls"].capabilities))
