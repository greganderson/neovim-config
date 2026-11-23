-- Arduino sketches: use plain clangd instead of arduino-language-server.
-- arduino-language-server 0.7.7 desyncs its .ino -> .ino.cpp line map, clangd then
-- drops the document and every request fails with "... for non-added document".
-- Each sketch needs a compile_commands.json (see gen-compile-db.sh in the sketch dir);
-- clangd settings for the `arduino` filetype live in after/lsp/clangd.lua.

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    servers = { "clangd" }, -- system clangd (/usr/bin/clangd), not installed via Mason
    handlers = {
      arduino_language_server = false, -- installed in Mason, but don't start it
    },
  },
}
