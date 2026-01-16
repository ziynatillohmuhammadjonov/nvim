return {
	{
		"mg979/vim-visual-multi",
		init = function()
			-- Standart mappinglarni butunlay o'chiramiz
			vim.g.VM_default_mappings = 0

			-- Yangi mappinglarni o'rnatamiz
			vim.g.VM_maps = {
				["Find Under"] = "<leader>s", -- Kursor ostidagi so'zni tanlash (Similar)
				["Find Subword Under"] = "<leader>s", -- So'z qismini tanlash
				["Select All"] = "<leader>S", -- Barcha o'xshashlarni tanlash (Shift + S)
				["Skip Region"] = "<C-x>", -- Buni o'tkazib yuborish
				["Remove Region"] = "<C-p>", -- Oxirgi tanlangan kursorni o'chirish
			}
		end,
	},
}
