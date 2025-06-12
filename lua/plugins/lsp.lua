return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      server = {
        typescript = {
          filetypes = {"javascript", "html"}
        }
      }
    }
  }
}
