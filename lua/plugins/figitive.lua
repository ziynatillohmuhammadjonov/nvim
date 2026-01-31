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

			-- Git Log (Graph)
			{ "<leader>gh", ":Flog<CR>", desc = "Git Log (Graph)" },

			-- Branch list
			{ "<leader>gb", ":Git branch<CR>", desc = "Git Branch (List)" },

			-- Branch switch
			{ "<leader>go", ":Git checkout ", desc = "Git Checkout (Switch branch)" },

			-- New branch
			{ "<leader>gn", ":Git checkout -b ", desc = "Git New Branch" },

			----------------------------------------------------------------
			-- 🆕 PRO FEATURES 🔥
			----------------------------------------------------------------

			-- So‘nggi commit diff (full preview)
			{ "<leader>gd", ":Git show<CR>", desc = "Git Show Last Commit Diff" },

			-- So‘nggi commitda o‘zgargan fayllar
			{ "<leader>gf", ":Git show --name-only<CR>", desc = "Git Last Commit Files" },

			-- Commit history (oneline)
			{ "<leader>gL", ":Git log --oneline<CR>", desc = "Git Log (Oneline)" },

			-- Hozirgi fayl history
			{ "<leader>gH", ":0Gclog<CR>", desc = "Git File History" },

			-- HEAD diff (working tree vs last commit)
			{ "<leader>gD", ":Gvdiffsplit<CR>", desc = "Git Diff (Working tree vs HEAD)" },
		},
	},
}
