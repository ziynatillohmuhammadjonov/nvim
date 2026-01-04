return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 15,
				open_mapping = [[<leader>t]], -- Bu hali ham barcha terminallarni yopish/ochish uchun ishlaydi
				direction = "horizontal",
			})

			-- Yangi terminal qo'shish funksiyasi
			local terminal_count = 0
			local function open_new_terminal()
				terminal_count = terminal_count + 1
				vim.cmd(terminal_count .. "ToggleTerm")
			end

			-- Bitta tugma bilan yangi terminal ochish (masalan: leader + tn)
			vim.keymap.set("n", "<leader>tn", open_new_terminal, { desc = "Yangi terminal qo'shish" })

			-- Navigatsiya (oldingi yozganimiz)
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				-- Terminal rejimida 'jj' yoki 'jk' bossa Normal rejimga o'tish
				vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

				-- ESC tugmasini ham Normal rejimga o'tish uchun sozlash (ixtiyoriy)
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

				-- Navigatsiya tugmalari (oldingi yozganlarimiz)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

				-- 3. Yashirish (Toggle/Hide) - Server ishlab turaveradi
				vim.keymap.set("t", "<C-q>", [[<C-\><C-n><Cmd>ToggleTerm<CR>]], opts)

				-- 4. O'CHIRISH (Kill/Close) - Server to'xtaydi va terminal yopiladi
				vim.keymap.set("t", "<C-x>", [[<C-\><C-n><Cmd>bdelete!<CR>]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
