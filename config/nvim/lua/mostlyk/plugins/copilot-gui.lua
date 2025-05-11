return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>eo",
				":CopilotChatOpen<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ec",
				":CopilotChatClose<CR>",
				{ noremap = true, silent = true, desc = "Close Copilot Chat" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>et",
				":CopilotChatToggle<CR>",
				{ noremap = true, silent = true, desc = "Toggle Copilot Chat" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>es",
				":CopilotChatStop<CR>",
				{ noremap = true, silent = true, desc = "Stop Copilot Chat Output" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>er",
				":CopilotChatReset<CR>",
				{ noremap = true, silent = true, desc = "Reset Copilot Chat" }
			)
		end,

		-- See Commands section for default commands if you want to lazy load on them
	},
}
