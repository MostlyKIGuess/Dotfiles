return {
	"nvim-lua/plenary.nvim", -- Useful for running external commands
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>p", ":silent !zathura % &<CR>", { noremap = true, silent = true })
	end,
}
