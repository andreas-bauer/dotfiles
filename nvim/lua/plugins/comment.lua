return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- for commenting tsx, jsx, svelte
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    require("Comment").setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
