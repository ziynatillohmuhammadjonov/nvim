return {
	{ "tpope/vim-fugitive" },
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
		keys = {
			-- Git Status (Oynani ochish)
			{ "<leader>gs", vim.cmd.Git, desc = "Git Status" },
			-- Git Push (Kodlarni serverga yuborish)
			{ "<leader>gp", ":Git push<CR>", desc = "Git Push" },
			-- Git Pull (Serverdan yangilanishlarni olish)
			{ "<leader>gl", ":Git pull<CR>", desc = "Git Pull" },
			-- Git Commit (Xabar bilan saqlash)
			{ "<leader>gc", ":Git commit<CR>", desc = "Git Commit" },
			-- Git Log (Flog grafikali tarix)
			{ "<leader>gh", ":Flog<CR>", desc = "Git Log (Graph)" },
		},
	},
}
