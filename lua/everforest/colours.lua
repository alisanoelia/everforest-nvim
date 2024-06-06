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
		bg_dim = "#0d1617",
		bg0 = "#272e33",
		bg1 = "#2e383c",
		bg2 = "#374145",
		bg3 = "#414b50",
		bg4 = "#495156",
		bg5 = "#4f5b58",
		bg_visual = "#4c3743",
		bg_red = "#493b40",
		bg_green = "#3c4841",
		bg_blue = "#384b55",
		bg_yellow = "#45443c",
	},
	light = {
		bg_dim = "#f2efdf",
		bg0 = "#fffbef",
		bg1 = "#f8f5e4",
		bg2 = "#f2efdf",
		bg3 = "#edeada",
		bg4 = "#e8e5d5",
		bg5 = "#bec5b2",
		bg_visual = "#f0f2d4",
		bg_red = "#ffe7de",
		bg_green = "#f3f5d9",
		bg_blue = "#ecf5ed",
		bg_yellow = "#fef2d5",
	},
}


---@type table<Backgrounds, PaletteBase>
local base_palette = {
	dark = {
		fg = "#5c6a72",
		red = "#f85552",
		orange = "#f57d26",
		yellow = "#dfa000",
		green = "#8da101",
		aqua = "#35a77c",
		blue = "#3a94c5",
		purple = "#df69ba",
		grey0 = "#a6b0a0",
		grey1 = "#939f91",
		grey2 = "#829181",
		statusline1 = "#93b259",
		statusline2 = "#708089",
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
