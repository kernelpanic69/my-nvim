-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }
-- NvimTree
map("n", "<C-A-E>", ":NvimTreeToggle<cr>")

-- Terminal
map("n", "<A-t>", ":Ttoggle<cr>")

-- Windows
map("n", "<C-Left>", ":wincmd h<cr>")
map("n", "<C-Right>", ":wincmd l<cr>")
map("n", "<C-Down>", ":wincmd j<cr>")
map("n", "<C-Up>", ":wincmd k<cr>")

map("n", "<C-h>", ":wincmd h<cr>")
map("n", "<C-l>", ":wincmd l<cr>")
map("n", "<C-j>", ":wincmd j<cr>")
map("n", "<C-k>", ":wincmd k<cr>")

map("n", "<C-s>", "<cmd>write<cr>")

map("n", "<C-a>", "<cmd>JABSOpen <cr>")

vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.cmd("inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : \"\\<C-g>u\\<CR>\"")

-- Buffers
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)


-- WhichKeys

local wk = require("which-key")

wk.register({
	e = { "<cmd>HopWord <cr>", "Explore" },
	c = {
		name = "Configuration",
		i = { "<cmd>tabnew ~/.config/nvim/init.lua <cr>", "Open main config" },
		k = { "<cmd>tabnew ~/.config/nvim/lua/keys.lua <cr>", "Open keybindings" },
		o = { "<cmd>tabnew ~/.config/nvim/lua/opts.lua <cr>", "Open editor options" },
		p = { "<cmd>tabnew ~/.config/nvim/lua/plug.lua <cr>", "Open plugins config" },
		u = { "<cmd>PackerSync <cr>", "Update plugins" },
	},
	s = {
		name = "Search",
		f = { "<cmd>Telescope find_files<cr>", "Search files" },
		a = { "<cmd>Telescope live_grep<cr>", "Search everywhere" },
		h = { "<cmd>Telescope search_history <cr>", "Search history" },
		c = { "<cmd>Cheatsheet <cr>", "Search cheatsheet" },
		b = { "<cmd>Telescope buffers <cr>", "Recent buffers" },
	},
	l = {
		name = "LSP",
		f = { "<cmd>CocCommand editor.action.formatDocument <cr>", "Format document with lsp" },
	},
	w = {
		name = "windows",
		d = { "<cmd>CocDiagnostics <cr>", "Diagnostics" },
		t = { "<cmd>Ttoggle <cr>", "Terminal" },
		f = { "<cmd>NvimTreeToggle <cr>", "Files" },
		o = { "<cmd>CocList outline <cr>", "Outline" },
	},
	v = {
		name = "VCS",
		h = { "<cmd>VGit buffer_hunk_preview <cr>", "Hunk preview" },
		d = { "<cmd>VGit buffer_diff_preview <cr>", "Diff current file" },
	},
}, { prefix = "<Leader>" })
