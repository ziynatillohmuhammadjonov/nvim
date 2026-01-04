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
			-- Git Status
			{ "<leader>gs", vim.cmd.Git, desc = "Git Status" },
			-- Git Push
			{ "<leader>gp", ":Git push<CR>", desc = "Git Push" },
			-- Git Pull
			{ "<leader>gl", ":Git pull<CR>", desc = "Git Pull" },
			-- Git Commit
			{ "<leader>gc", ":Git commit<CR>", desc = "Git Commit" },
			-- Git Log
			{ "<leader>gh", ":Flog<CR>", desc = "Git Log (Graph)" },

			-- Hamma branchlarni ro'yxatini ko'rish
			{ "<leader>gb", ":Git branch<CR>", desc = "Git Branch (List)" },
			-- Branchlar orasida o'tish (Checkout)
			{ "<leader>go", ":Git checkout ", desc = "Git Checkout (Switch branch)" },
			-- Yangi branch ochish
			{ "<leader>gn", ":Git checkout -b ", desc = "Git New Branch" },
		},
	},
}
