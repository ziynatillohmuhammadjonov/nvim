return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				display = {
					chat = {
						show_token_count = false, -- Har bir harfda tahlil qilmaslik
					},
				},
				opts = {
					send_code = false, -- Avtomatik yubormaslik
				},
				strategies = {
					chat = {
						adapter = "gemini",
						keymaps = {
							send = {
								modes = { n = "<CR>", i = "<C-s>" }, -- Faqat shu tugmalar bilan yuborish
							},
						},
					},
				},
				adapters = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							schema = {
								model = {
									default = "gemini-1.5-flash", -- FLASH modelini ishlating!
								},
							},
							env = {
								api_key = os.getenv("GEMINI_API_KEY"),
							},
						})
					end,
				},
			})

			-- KEYMAPLAR
			vim.keymap.set({ "n", "v" }, "<leader>ga", "<cmd>CodeCompanionActions<cr>", { desc = "AI: Harakatlar" })
			vim.keymap.set({ "n", "v" }, "<leader>gc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI: Chat" })
			vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "AI: Chatga qo'shish" })
		end,
	},
}
