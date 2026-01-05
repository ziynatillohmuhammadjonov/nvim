return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- Aynan siz tanlagan rasmda shu variant
				transparent_background = false,
				term_colors = true,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = { "bold" },
					keywords = { "italic" },
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				custom_highlights = function(colors)
					return {
						-- Ogohlantirish (Warning) yozuvlarini juda xira (overlay) rangga o'tkazish
						DiagnosticWarn = { fg = colors.overlay0 }, -- Bu rang to'q kulrang/xira bo'ladi
						DiagnosticVirtualTextWarn = { fg = colors.surface1, bg = "none" }, -- Satr oxiridagi matn yanada xira

						-- Agar xatolar (Errors) ham juda yorqin bo'lsa, ularni ham yumshatish mumkin:
						DiagnosticUnnecessary = { fg = colors.overlay0, style = { "undercurl" } },
					}
				end,
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					-- Bufferline va NvimTree integratsiyasi (Sizning skrinshotda bor)
					bufferline = true,
					nvimtree = true,
					telescope = { enabled = true },
					gitsigns = true,
					indent_blankline = { enabled = true },
				},
			})
			--vim.cmd.colorscheme("catppuccin")
		end,
	},
}
