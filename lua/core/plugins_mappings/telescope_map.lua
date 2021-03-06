local map = require("core.utils").map
--> Telescope
map("n", "<leader>vc", ":Telescope git_commits<CR>", { noremap = true, silent = true })
map("n", "<leader>b", ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
map("n", "<leader>vo", ":Telescope vim_options<CR>", { noremap = true, silent = true })
map("n", "<leader>vm", ":Telescope marks<CR>", { noremap = true, silent = true })
map("n", "<leader>ch", ":Telescope keymaps<CR>", { noremap = true, silent = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
map("n", "<leader>fh", ":Telescope help_tags<cr>", { noremap = true, silent = true })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
map("n", "<leader>fm", ":Telescope media_files<cr>", { noremap = true, silent = true })
map("n", "<leader>tb", ":Telescope file_browser previewer=false<cr>", { noremap = true, silent = true })
map(
	"n",
	"<leader>en",
	":lua require('plugins.configs.telescope').search_nvim_dotfiles()<cr>",
	{ noremap = true, silent = true }
)

map(
	"n",
	"<leader>f;",
	":lua require('plugins.configs.telescope').ivy_find_files_with_preview()<cr>",
	{ noremap = true, silent = true }
)
map("n", "<leader>fb",
	":lua require('plugins.configs.telescope').center_list_buffers_find()<cr>",
    { noremap = true, silent = true })
map("n", "<leader>tc",
	":lua require('plugins.configs.telescope').ivy_colorscheme_preview()<cr>",
    { noremap = true, silent = true })
map(
	"n",
	"<leader>ff",
	-- ":Telescope find_files theme=get_cursor previewer=false find_command=rg,--hidden,--files<CR>",
	":lua require('plugins.configs.telescope').center_list_find_files()<cr>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<C-_>",
	":lua require('plugins.configs.telescope').current_buffer_fuzzy_find()<cr>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>ds",
	":lua require('plugins.configs.telescope').center_list_document_symbols_find()<cr>",
	{ noremap = true, silent = true }
)


--> Telescope core mappings
local M = {}
M.mappings = function()
	return {
		i = {
			["<C-l>"] = require("telescope.actions").cycle_history_next,
			["<C-h>"] = require("telescope.actions").cycle_history_prev,
			-- ["<C-j>"] = require("telescope.actions").move_selection_next,
			-- ["<C-k>"] = require("telescope.actions").move_selection_previous,
		},
		n = {
			["<C-[>"] = require("telescope.actions").close,
		},
	}
end
return M
