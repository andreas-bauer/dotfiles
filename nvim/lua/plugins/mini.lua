return {
  "echasnovski/mini.nvim",
  version = false,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.icons").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()
    require("mini.indentscope").setup()
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })
  end,
}
