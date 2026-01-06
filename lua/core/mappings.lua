-- Leader
vim.g.mapleader = " "

-- Basic
vim.keymap.set("i", "jk", "<Esc>") -- Insertdan chiqish
vim.keymap.set("n", "<leader>w", ":w<CR>") -- Saqlash
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>") -- Qidiruv rangini tozalash

-- Neo-Tree
vim.keymap.set("n", "<leader>e", ":Neotree left toggle reveal<CR>")

-- Navigation (Oynalar orasida sakrash)
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Splits (Oynalarni bo'lish)
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Tabs (BufferLine)
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<c-x>", ":BufferLineCloseOthers<CR>")

-- Kodni blok holatida surish (Alt+J/K kabi)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indentatsiya (Selectionni saqlab qoladi)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Oyna o'lchamlarini o'zgartirish (Ctrl + Arrows)
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Terminallarni raqam bilan ochish uchun qisqa yo'llar
vim.keymap.set("n", "<leader>t1", ":1ToggleTerm<CR>", { desc = "Terminal 1" })
vim.keymap.set("n", "<leader>t2", ":2ToggleTerm<CR>", { desc = "Terminal 2" })
vim.keymap.set("n", "<leader>t3", ":3ToggleTerm<CR>", { desc = "Terminal 3" })

-- Hammasini yopish yoki ochish
vim.keymap.set("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { desc = "Barcha terminallarni ochish/yopish" })

-- Insert rejimida harakatlanish (Ctrl orqali)
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Bitta belgi orqaga" })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Bitta belgi oldinga" })
vim.keymap.set("i", "<C-a>", "<ESC>^i", { desc = "Qator boshiga sakrash" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Qator oxiriga sakrash" })

-- Butun faylni nusxalash (leader + ya)
vim.keymap.set("n", "<leader>ya", "<cmd>%y<cr>", { desc = "Butun faylni nusxalash" })

-- Nusxalangan qismni yoritish (Highlight on yank)
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
vim.keymap.set({ "n", "v" }, "<C-/>", function()
	local ok, ts_internal = pcall(require, "ts_context_commentstring.internal")
	if ok then
		local cs = ts_internal.calculate_commentstring()
		if cs then
			vim.bo.commentstring = cs
		end
	end
	return "gc"
end, { expr = true, remap = true })

-- Normal rejimda qatorni surish
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Qatorni pastga surish" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Qatorni yuqoriga surish" })

-- Visual rejimda (blokni surish)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Blokni pastga surish" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Blokni yuqoriga surish" })

-- Insert rejimida (yozayotgan paytda surish)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Qatorni pastga surish" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Qatorni yuqoriga surish" })

-- Normal rejim (Mac uchun maxsus belgilar bilan)
vim.keymap.set("n", "∆", ":m .+1<CR>==", { desc = "Qatorni pastga surish" }) -- Option + j
vim.keymap.set("n", "˚", ":m .-2<CR>==", { desc = "Qatorni yuqoriga surish" }) -- Option + k

-- Visual rejim
vim.keymap.set("v", "∆", ":m '>+1<CR>gv=gv", { desc = "Blokni pastga surish" })
vim.keymap.set("v", "˚", ":m '<-2<CR>gv=gv", { desc = "Blokni yuqoriga surish" })

-- Insert rejim
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", { desc = "Qatorni pastga surish" })
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", { desc = "Qatorni yuqoriga surish" })
