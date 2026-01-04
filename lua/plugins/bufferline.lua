return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers", -- Tablar emas, aynan bufferlar bilan ishlash
					numbers = "ordinal", -- Har bir faylga raqam beradi (o'tish oson bo'lishi uchun)
					close_command = "bdelete! %d", -- Faylni yopish buyrug'i
					right_mouse_command = "bdelete! %d", -- Sichqonchaning o'ng tugmasi bilan yopish
					indicator = {
						style = "underline", -- Aktiv fayl ostiga chiziq chizadi
					},
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					-- Eslint va boshqa xatolarni tepadagi tabda ko'rsatish
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or "󰋼 ")
							s = s .. n .. sym
						end
						return s
					end,
					-- NvimTree ochiq turganda bufferlar surilib ketmasligi uchun
					offsets = {
						{
							filetype = "NvimTree",
							text = "Fayllar",
							text_align = "left",
							separator = true,
						},
					},
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					persist_buffer_sort = true,
					separator_style = "thin", -- "slant", "thick", "thin" variantlari bor
					enforce_regular_tabs = false,
					always_show_bufferline = true,
				},
			})
		end,
	},
}
