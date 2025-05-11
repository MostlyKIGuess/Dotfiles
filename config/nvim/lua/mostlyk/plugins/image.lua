return {
	"3rd/image.nvim",
	config = function()
		require("image").setup({
			backend = "kitty", -- Or "ueberzug" depending on your terminal
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
				},
			},
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- Clear images when windows are overlapping
		})
	end,
}
