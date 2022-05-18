-- more mappings are defined in `lua/config/which.lua`
local map = vim.keymap.set
default_options = { silent = true }
expr_options = { expr = true, silent = true }

--Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

--Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", default_options)
map("n", "<S-TAB>", ":bprevious<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Resizing panes
-- map("n", "<Left>", ":vertical resize +1<CR>", default_options)
-- map("n", "<Right>", ":vertical resize -1<CR>", default_options)
-- map("n", "<Up>", ":resize -1<CR>", default_options)
-- map("n", "<Down>", ":resize +1<CR>", default_options)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- Change theme
map("n", "<leader>vd", ":colorscheme duskfox<CR>", default_options )
map("n", "<leader>vl", ":colorscheme dayfox<CR>", default_options )

-- Nvim Tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true})

-- starlite mappings
map("n", "*", function()
	return require("starlite").star()
end, default_options)
map("n", "g*", function()
	return require("starlite").g_star()
end, default_options)
map("n", "#", function()
	return require("starlite").hash()
end, default_options)
map("n", "g#", function()
	return require("starlite").g_hash()
end, default_options)

-- Telescope
map( "n", "<space>ff", ":Telescope find_files<CR>", { noremap = true })
map( "n", "<space>fd", ":Telescope file_browser<CR>", { noremap = true })
map( "n", "<space>fg", ":Telescope live_grep<CR>", { noremap = true })
map( "n", "<space>fb", ":Telescope buffers<CR>", { noremap = true })
map( "n", "<space>fh", ":Telescope help_tags<CR>", { noremap = true })

-- LSP
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

function EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

-- move over a closing element in insert mode
map("i", "<C-l>", function()
	return EscapePair()
end, default_options)
