local g = vim.g

local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup({
	-- disables netrw completely
	disable_netrw = true,
	-- hijack netrw window on startup
	hijack_netrw = true,
	-- opens the tree when changing/opening a new tab if the tree wasn't previously opened
	open_on_tab = true,
	-- hijack the cursor in the tree to put it at the start of the filename
	hijack_cursor = true,
	-- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
	update_cwd = true,
	filters = {
		-- this option hides files and folders starting with a dot `.`
		dotfiles = false,
	},
	-- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
	respect_buf_cwd = true,
	-- show lsp diagnostics in the signcolumn
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	git = { enable = true, ignore = true, timeout = 400 },
	-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
	update_focused_file = {
		-- enables the feature
		enable = true,
		-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
		-- only relevant when `update_focused_file.enable` is true
		update_cwd = true,
		-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
		-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
		ignore_list = { ".git", "node_modules", ".cache" },
	},
	-- configuration options for the system open command (`s` in the tree by default)
	system_open = {
		-- the command to run this, leaving nil should work in most cases
		cmd = nil,
		-- the command arguments as a list
		args = {},
	},

	trash = { cmd = "trash-put", require_confirm = true },

	actions = {
		change_dir = { enable = true, global = false },
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = {
						"notify",
						"packer",
						"qf",
						"diff",
						"fugitive",
						"fugitiveblame",
					},
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	renderer = {
	add_trailing = true, -- 0 by default, append a trailing slash to folder names
	group_empty = false,
	highlight_git = true, -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
	highlight_opened_files = "icon",
	root_folder_modifier = ":~",
	indent_markers = {
	  enable = true,
	  icons = {
		corner = "└ ",
		edge = "│ ",
		none = "  ",
	  },
	},
	icons = {
		webdev_colors = true,
		git_placement = "before",
		padding = " ",
		symlink_arrow = " ➛ ",
		show = {
			file = true,
			folder = true,
			folder_arrow = true,
			git = true,
		},
		glyphs = {
			default = "",
			symlink = "",
			folder = {
				arrow_closed = "",
				arrow_open = "",
				default = "",
				open = "",
				empty = "",
				empty_open = "",
				symlink = "",
				symlink_open = "",
			},
			git = {
				unstaged = "✗",
				staged = "✓",
				unmerged = "",
				renamed = "➜",
				untracked = "U",
				deleted = "",
				ignored = "◌",
			},
		},
	},
	special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
	},

	view = {
		-- show line numbers in tree disabled
		number = false,
		relativenumber = false,
		-- width of the window, can be either a number (columns) or a string in `%`
		width = 30,
		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = "left",
		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = true,
			-- list of mappings to set on the tree manually
			list = {
				{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
				{ key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
				{ key = "<C-v>", cb = tree_cb("vsplit") },
				{ key = "<C-x>", cb = tree_cb("split") },
				{ key = "<C-t>", cb = tree_cb("tabnew") },
				{ key = "<", cb = tree_cb("prev_sibling") },
				{ key = ">", cb = tree_cb("next_sibling") },
				{ key = "P", cb = tree_cb("parent_node") },
				{ key = "<BS>", cb = tree_cb("close_node") },
				{ key = "<S-CR>", cb = tree_cb("close_node") },
				{ key = "<Tab>", cb = tree_cb("preview") },
				{ key = "K", cb = tree_cb("first_sibling") },
				{ key = "J", cb = tree_cb("last_sibling") },
				{ key = "I", cb = tree_cb("toggle_ignored") },
				{ key = "H", cb = tree_cb("toggle_dotfiles") },
				{ key = "R", cb = tree_cb("refresh") },
				{ key = "a", cb = tree_cb("create") },
				{ key = "d", cb = tree_cb("remove") },
				{ key = "r", cb = tree_cb("rename") },
				{ key = "<C-r>", cb = tree_cb("full_rename") },
				{ key = "x", cb = tree_cb("cut") },
				{ key = "c", cb = tree_cb("copy") },
				{ key = "p", cb = tree_cb("paste") },
				{ key = "y", cb = tree_cb("copy_name") },
				{ key = "Y", cb = tree_cb("copy_path") },
				{ key = "gy", cb = tree_cb("copy_absolute_path") },
				{ key = "[c", cb = tree_cb("prev_git_item") },
				{ key = "]c", cb = tree_cb("next_git_item") },
				{ key = "-", cb = tree_cb("dir_up") },
				{ key = "s", cb = tree_cb("system_open") },
				{ key = "q", cb = tree_cb("close") },
				{ key = "g?", cb = tree_cb("toggle_help") },
			},
		},
	},
})
