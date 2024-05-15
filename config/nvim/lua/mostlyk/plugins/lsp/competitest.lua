return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			local_config_file_name = ".competitest.lua",
			evaluate_template_modifiers = true,
			template_file = {
				cpp = "~/.config/nvim/lua/mostlyk/plugins/lsp/templatecp.cpp",
			},
		})

		-- Add key mappings
		local map = vim.api.nvim_set_keymap
		local options = { noremap = true, silent = true }

		-- Map <leader>ct to run all test cases
		map("n", "<leader>ct", ":CompetiTest run<CR>", options)

		-- Map <leader>cui to open the UI
		map("n", "<leader>cui", ":CompetiTest show_ui<CR>", options)
	end,
}
