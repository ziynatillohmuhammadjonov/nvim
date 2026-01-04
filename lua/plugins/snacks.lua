return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = {
				enabled = true,
				sections = {
					{ section = "header" }, -- Standart header (xato bermasligi uchun)
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
				-- O'zbekcha tugmalarni mana shu yerda beramiz
				preset = {
					header = [[
  ______  _____ __     __ _   _         _______  _____  _       _         ____  _    _ 
 |___  / |_   _|\ \   / /| \ | |    /\  |__   __||_   _|| |     | |       / __ \| |  | |
    / /    | |   \ \_/ / |  \| |   /  \    | |     | |  | |     | |      | |  | | |__| |
   / /     | |    \   /  | . ` |  / /\ \   | |     | |  | |     | |      | |  | |  __  |
  / /__   _| |_    | |   | |\  | / ____ \  | |    _| |_ | |____ | |____  | |__| | |  | |
 /_____| |_____|   |_|   |_| \_|/_/    \_\ |_|   |_____||______||______|  \____/|_|  |_|
          ]],
					keys = {
						{ icon = " ", key = "f", desc = "Fayl qidirish", action = ":lua Snacks.picker.files()" },
						{ icon = " ", key = "n", desc = "Yangi fayl", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Matn qidirish", action = ":lua Snacks.picker.grep()" },
						{ icon = " ", key = "r", desc = "Oxirgi fayllar", action = ":lua Snacks.picker.recent()" },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Chiqish", action = ":qa" },
					},
				},
			},
			-- Boshqa muhim modullar
			picker = { enabled = true },
			notifier = { enabled = true },
		},
	},
}
