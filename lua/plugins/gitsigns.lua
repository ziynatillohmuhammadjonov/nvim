return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				-- 1. Belgi (sign) ustunini sozlash
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},

				-- 2. Sizdagi mavjud Blame funksiyasi
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 500,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

				-- 3. Belgilar har doim ko'rinishi uchun (muhim)
				signcolumn = true,
			})
		end,
	},
}
