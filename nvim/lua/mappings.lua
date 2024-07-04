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

-- delete without yanking
-- map("n", "<leader>d", '"_d', default_options) -- Conflict with LSP keymap for debugging
-- map("v", "<leader>d", '"_d', default_options) -- Conflict with LSP keymap for debugging
map("n", "<leader>dd", '"_dd', default_options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", default_options)
map("n", "<S-TAB>", ":bprevious<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Autocorrect spelling from previous error
map("i", "<C-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- Change theme
map("n", "<leader>vd", ":Catppuccin mocha<CR>", default_options)
map("n", "<leader>vl", ":Catppuccin latte<CR>", default_options)

-- Toggle display of white space chars
map("n", "<leader><TAB><TAB>", ":set invlist<CR>", default_options)

-- Oil file explorer
map("n", "-", ":Oil<CR>", { noremap = true, desc = "Open parent directory" })

-- Nvim Tree
map("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true, desc = "Toggle file explorer" })
map("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { noremap = true, desc = "Toggle file explorer on current file" })
map("n", "<leader>ec", ":NvimTreeCollapse<CR>", { noremap = true, desc = "Collapse file explorer" })
map("n", "<leader>er", ":NvimTreeRefresh<CR>", { noremap = true, desc = "Refresh file explorer" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, desc = "Telescope: find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, desc = "Telescope: find string" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, desc = "Telescope: find open buffer" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>fc", ":Telescope grep_string<cr>", { noremap = true, desc = "Telescope: find string under cursor" })
