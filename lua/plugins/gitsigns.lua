return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true, -- Mana shu funksiyani yoqadi
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- Qator oxirida ko'rsatish ('overlay' yoki 'right_align' ham bo'ladi)
					delay = 500, -- Kursor qatorda qancha turgandan keyin chiqishi (millisekundda)
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			})
		end,
	},
}
