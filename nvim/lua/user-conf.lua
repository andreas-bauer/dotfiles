local M = {}

-- Toggle global status line
M.global_statusline = true
-- use rg instead of grep
M.grepprg = "rg --hidden --vimgrep --smart-case --"
-- set numbered lines
M.number = true
-- set relative numbered lines
M.relative_number = false

return M
