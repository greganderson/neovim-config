-- Workarounds for arduino-language-server 0.7.7, which predates newer clangd (23.x) features.
return {
  -- Don't advertise insert/replace completion edits: clangd would then send
  -- InsertReplaceEdit, which the server can't decode ("undefined required field range").
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          insertReplaceSupport = false,
        },
      },
    },
  },
  on_init = function(client)
    -- The server panics on clangd's document symbol tags.
    client.server_capabilities.documentSymbolProvider = false
  end,
}
