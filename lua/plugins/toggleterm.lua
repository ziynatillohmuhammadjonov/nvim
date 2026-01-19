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
	"akinsho/toggleterm.nvim",
	version = "*",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local tt = require("toggleterm")
		local os_name = vim.loop.os_uname().sysname

		-- MacOS uchun 'zsh', Windows uchun 'powershell.exe'
		local default_shell = os_name == "Windows_NT" and "powershell.exe" or "zsh"

		tt.setup({
			size = 15,
			direction = "horizontal",
			open_mapping = [[<c-\>]],
			start_in_insert = true,
			persist_size = true,
			close_on_exit = false, -- Debug tugaguncha false tursin
			shell = default_shell, -- DINAMIK SHEL
		})

		local os_name = vim.loop.os_uname().sysname
		local shell_list = {}

		if os_name == "Windows_NT" then
			shell_list = {
				-- DIQQAT: cmd qismini bitta qilib yozamiz, args bo'sh bo'ladi
				{ name = "Git Bash", cmd = [[& "C:/Program Files/Git/bin/bash.exe" --login -i]], args = {} },
				{ name = "PowerShell", cmd = "powershell.exe", args = {} },
				{ name = "Command Prompt", cmd = "cmd.exe", args = {} },
			}
		else
			-- Linux/MacOS uchun eski holicha qoladi
			shell_list = {
				{ name = "Zsh", cmd = "zsh", args = { "--login" } },
				{ name = "Bash", cmd = "bash", args = {} },
			}
		end

		local function select_terminal_shell()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Terminal Tanlang",
					finder = require("telescope.finders").new_table({
						results = shell_list,
						entry_maker = function(entry)
							return { value = entry, display = entry.name, ordinal = entry.name }
						end,
					}),
					sorter = require("telescope.config").values.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, _)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local data = action_state.get_selected_entry().value

							-- Windows uchun maxsus mantiq:
							-- Biz cmd ichida hamma narsani berganimiz uchun ToggleTerm uni PowerShell
							-- ichida string sifatida bajarishi kerak.
							require("toggleterm.terminal").Terminal
								:new({
									cmd = data.cmd,
									hidden = true,
									direction = "horizontal",
								})
								:toggle()
						end)
						return true
					end,
				})
				:find()
		end

		vim.keymap.set("n", "<leader>ts", select_terminal_shell, { desc = "Terminal: Shell tanlash" })
		vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Terminal: Toggle" })

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts) -- Terminaldan chiqish
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
