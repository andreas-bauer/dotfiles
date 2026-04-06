return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- Show hidden/dotfiles
        ignored = false, -- Show .gitignore files
        sources = {
          files = {
            hidden = true, -- Show hidden/dotfiles
            ignored = false, -- Show .gitignore files
          },
        },
      },
    },
  },
}
