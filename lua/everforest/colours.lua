local M = {}

---@class PaletteBackground
---@field bg_dim string
---@field bg0 string
---@field bg1 string
---@field bg2 string
---@field bg3 string
---@field bg4 string
---@field bg5 string
---@field bg_visual string
---@field bg_red string
---@field bg_green string
---@field bg_blue string
---@field bg_yellow string

---@class PaletteBase
---@field fg string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field aqua string
---@field blue string
---@field purple string
---@field grey0 string
---@field grey1 string
---@field grey2 string
---@field statusline1 string
---@field statusline2 string
---@field statusline3 string
---@field none string

---@class Palette: PaletteBase,PaletteBackground

---@alias Backgrounds "light" | "dark"
---@alias PaletteBackgrounds table<Backgrounds, PaletteBackground>

---@type PaletteBackgrounds
local hard_background = {
	dark = {
		bg_dim = "#00171a",
		bg0 = "#00171a",
		bg1 = "#00171a",
		bg2 = "#00171a",
		bg3 = "#00363d",
		bg4 = "#d3cccc",
		bg5 = "#a1a1a1",
		bg_visual = "#d3cccc",
		bg_red = "#493b40",
		bg_green = "#3c4841",
		bg_blue = "#384b55",
		bg_yellow = "#45443c",
	},
}


---@type table<Backgrounds, PaletteBase>
local base_palette = {
	dark = {
		fg = "#d3cccc",
		red = "#f85552",
		orange = "#f57d26",
		yellow = "#dfa000",
		green = "#35a77c",
		aqua = "#33b5aa",
		blue = "#3a94c5",
		purple = "#d33682",
		grey0 = "#f2f2f2",
		grey1 = "#d3cccc",
		grey2 = "#a1a1a1",
		statusline1 = "#004b55",
		statusline2 = "#7d9999",
		statusline3 = "#e66868",
		none = "NONE",
	},
}

---Generates the colour palette based on the user's config
---@param options Config The package configuration table
---@param theme "light" | "dark" The user's background preference
---@return Palette
M.generate_palette = function(options, theme)
	local background = options.background or "medium"
	local base = base_palette[theme]
	---@type PaletteBackground
	local background_palette

	if background == "hard" then
		background_palette = hard_background[theme]
	else
	end

	---@type Palette
	local combined_palette = vim.tbl_extend("force", base, background_palette)
	options.colours_override(combined_palette)

	return combined_palette
end

return M
