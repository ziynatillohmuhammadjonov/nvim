return {
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				delay = 100, -- 0.1 soniyada yoritadi
				under_cursor = true, -- Kursor ostidagi so'zni ham yoritish
			})

			-- Ranglarni sozlash (rang chiqmasa shuni qo'shing)
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3b4261", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3b4261", underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3b4261", underline = true })
		end,
	},
}
