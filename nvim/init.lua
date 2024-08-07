-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- References to ./lua/
-- Vim mappings, see lua/config/which.lua for more mappings
require("mappings")
-- All non plugin related (vim) options
require("options")
-- Vim autocommands/autogroups
require("autocmd")
-- Plugin management via Lazy
require("lazy-config")

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- enable filetypee.lua
-- This feature is currently opt-in
-- as it does not yet completely match all of the filetypes covered by filetype.vim
vim.g.do_filetype_lua = nil
-- disable filetype.vim
vim.g.did_load_filetypes = nil
-- for JoosepAlviste/nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true
