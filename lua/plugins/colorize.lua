return {
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true, -- Tailwind klasslarini rangli ko'rsatish
					mode = "background", -- "foreground" yoki "background"
				},
			})
		end,
	},
}
