return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Mavzu boshqa pluginlardan oldin yuklanishi uchun
		config = function()
			-- 1. Gruvbox sozlamalari
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "soft", -- Ko'z uchun yumshoq variant
				palette_overrides = {},
				overrides = {
					-- Shaffoflikni (Opacity) majburlash
					Normal = { bg = "NONE", ctermbg = "NONE" },
					NonText = { bg = "NONE", ctermbg = "NONE" },
					SignColumn = { bg = "NONE", ctermbg = "NONE" },
					EndOfBuffer = { bg = "NONE", ctermbg = "NONE" },
					NormalFloat = { bg = "NONE", ctermbg = "NONE" },
					FloatBorder = { bg = "NONE", ctermbg = "NONE" },
					TelescopeNormal = { bg = "NONE", ctermbg = "NONE" },
					TelescopeBorder = { bg = "NONE", ctermbg = "NONE" },
				},
				dim_inactive = false,
				transparent_mode = true, -- Shaffoflikni yoqish
			})

			-- 2. Mavzuni ishga tushirish
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
