local themes = {
	"tokyonight",
	"gruvbox",
	"gruvbox-material",
	"onedark",
	"dracula",
	"everforest",
	"edge",
	"sonokai",
	"nord",
	"ayu",
	"one",
	"palenight",
	"papercolor",
	"tender",
	"molokai",
}
local current_theme = 2

local function cycle_theme()
	current_theme = current_theme % #themes + 1
	vim.cmd("colorscheme " .. themes[current_theme])
end

return {
	cycle_theme = cycle_theme,
}
