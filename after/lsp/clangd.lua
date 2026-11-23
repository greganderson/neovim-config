-- Extends nvim-lspconfig's clangd config so it also handles Arduino sketches (.ino).
return {
  cmd = {
    "clangd",
    "--background-index",
    -- Let clangd run the Arduino/ESP32 cross compilers to discover their system headers.
    "--query-driver=" .. vim.env.HOME .. "/.arduino15/packages/**",
  },
  filetypes = { "c", "c.doxygen", "cpp", "cpp.doxygen", "objc", "objcpp", "cuda", "arduino" },
}
