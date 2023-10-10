return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
      debounce = 75,
      keymap = {
        accept = "<C-l>",
        accept_word = false,
        accept_line = false,
        next = "<C-]>",
        -- prev = "<C-[>",
        dismiss = "<C-[>",
      },
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
