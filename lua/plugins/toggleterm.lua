-- return {
-- 	{
-- 		"akinsho/toggleterm.nvim",
-- 		version = "*",
-- 		config = function()
-- 			require("toggleterm").setup({
-- 				size = 15,
-- 				open_mapping = [[<leader>t]], -- Bu hali ham barcha terminallarni yopish/ochish uchun ishlaydi
-- 				direction = "horizontal",
-- 			})
--
-- 			-- Yangi terminal qo'shish funksiyasi
-- 			local terminal_count = 0
-- 			local function open_new_terminal()
-- 				terminal_count = terminal_count + 1
-- 				vim.cmd(terminal_count .. "ToggleTerm")
-- 			end
--
-- 			-- Bitta tugma bilan yangi terminal ochish (masalan: leader + tn)
-- 			vim.keymap.set("n", "<leader>tn", open_new_terminal, { desc = "Yangi terminal qo'shish" })
--
-- 			-- Navigatsiya (oldingi yozganimiz)
-- 			function _G.set_terminal_keymaps()
-- 				local opts = { buffer = 0 }
-- 				-- Terminal rejimida 'jj' yoki 'jk' bossa Normal rejimga o'tish
-- 				vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
-- 				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
--
-- 				-- ESC tugmasini ham Normal rejimga o'tish uchun sozlash (ixtiyoriy)
-- 				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
--
-- 				-- Navigatsiya tugmalari (oldingi yozganlarimiz)
-- 				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- 				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- 				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- 				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
--
-- 				-- 3. Yashirish (Toggle/Hide) - Server ishlab turaveradi
-- 				vim.keymap.set("t", "<C-q>", [[<C-\><C-n><Cmd>ToggleTerm<CR>]], opts)
--
-- 				-- 4. O'CHIRISH (Kill/Close) - Server to'xtaydi va terminal yopiladi
-- 				vim.keymap.set("t", "<C-x>", [[<C-\><C-n><Cmd>bdelete!<CR>]], opts)
-- 			end
--
-- 			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- 		end,
-- 	},
-- }
return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local tt = require("toggleterm")

			tt.setup({
				size = 15,
				direction = "horizontal",
				open_mapping = [[<c-\>]],
				-- Terminal ochilganda avtomatik yozish rejimiga o'tish
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				persist_size = true,
				close_on_exit = true,
			})

			-- 1. Shell tanlash funksiyasi
			local function select_terminal_shell()
				-- Telescope yuklanganini tekshirish
				local status_ok, _ = pcall(require, "telescope")
				if not status_ok then
					vim.notify("Telescope o'rnatilmagan!", vim.log.levels.ERROR)
					return
				end

				local pickers = require("telescope.pickers")
				local finders = require("telescope.finders")
				local conf = require("telescope.config").values
				local actions = require("telescope.actions")
				local action_state = require("telescope.actions.state")

				local shells = {}
				if vim.fn.has("win32") == 1 then
					shells = {
						"powershell.exe",
						"cmd.exe",
						"bash.exe",
						"pwsh.exe",
						"gitbash.exe --login -i",
					}
				else
					shells = { "zsh", "bash", "sh", "fish" }
				end

				pickers
					.new({}, {
						prompt_title = "Terminal Shell-ni tanlang",
						finder = finders.new_table({ results = shells }),
						sorter = conf.generic_sorter({}),
						attach_mappings = function(prompt_bufnr, _)
							actions.select_default:replace(function()
								actions.close(prompt_bufnr)
								local selection = action_state.get_selected_entry()
								-- Tanlangan shell bilan yangi terminalni ochish
								-- Bu yerda biz yangi terminal obyektini yaratib, uni ochamiz
								require("toggleterm.terminal").Terminal
									:new({
										cmd = selection[1],
										hidden = false,
										direction = "horizontal",
									})
									:toggle()
							end)
							return true
						end,
					})
					:find()
			end

			-- 2. KEYMAPLAR
			-- Shell tanlash
			vim.keymap.set("n", "<leader>ts", select_terminal_shell, { desc = "Shell tanlash" })
			-- Standart toggle (oxirgi ishlatilganini ochadi)
			vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal Toggle" })

			-- 3. TERMINAL ICHIDAGI SOZLAMALAR
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				-- Rejimlar orasida o'tish
				vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

				-- Navigatsiya
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

				-- Berkitish va O'chirish
				vim.keymap.set("t", "<C-q>", [[<C-\><C-n><Cmd>ToggleTerm<CR>]], opts)
				vim.keymap.set("t", "<C-x>", [[<C-\><C-n><Cmd>bdelete!<CR>]], opts)
			end

			-- Terminal ochilganda keymaplarni faollashtirish
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
