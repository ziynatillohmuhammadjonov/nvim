return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = {
				enabled = true,
				-- Picker UI sozlamalari (ixtiyoriy)
				layout = {
					preset = "default", -- yoki "vertical", "select"
				},
			},
			-- Dressing.nvim o'rnini bosuvchi qismlar:
			input = { enabled = true },
			select = { enabled = true },
			-- Bu qator Code Action-larni chiroyli qiladi
			select = { enabled = true },

			-- Qo'shimcha foydali funksiyalar:
			notifier = { enabled = true }, -- Xabarlar uchun
			dashboard = { enabled = true }, -- Bosh sahifa uchun
			statuscolumn = { enabled = true }, -- Chap tarafdagi raqamlar va belgilar uchun
			words = { enabled = true }, -- Bir xil so'zlarni yoritish
		},
		keys = {
			-- Masalan, notifications tarixini ko'rish uchun:
			{
				"<leader>un",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			-- Lazygitni ochish:
			{
				"<leader>gg",
				function()
					Snacks.snacks.lazygit()
				end,
				desc = "Lazygit",
			},
		},
	},
}
