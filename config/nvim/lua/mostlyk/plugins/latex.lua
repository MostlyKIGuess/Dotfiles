return {
	{
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_general_viewer = "zathura"
			vim.g.vimtex_view_general_options = "GDK_BACKEND=x11 zathura --fork"
			vim.g.vimtex_view_general_options_latexmk = "--fork"
			vim.g.vimtex_view_method = "general"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_quickfix_mode = 0
			vim.g.tex_conceal = "abdmg"
			vim.opt.conceallevel = 1

			vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "Compile LaTeX" })
			vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", { desc = "View PDF in Zathura" })
			vim.keymap.set("n", "<leader>ls", ":VimtexStop<CR>", { desc = "Stop LaTeX Compile" })
			vim.keymap.set("n", "<leader>ll", ":VimtexLog<CR>", { desc = "View Latex Log" })
		end,
	},
	{
		"jbyuki/nabla.nvim", -- For inline math preview
		config = function()
			vim.keymap.set("n", "<leader>mp", require("nabla").popup, { desc = "Inline Math Preview" })
		end,
	},
}
