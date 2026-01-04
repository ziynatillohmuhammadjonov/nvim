-- =============================================================================
-- LINE NUMBERS (VS Code uslubida)
-- =============================================================================
vim.wo.number = true -- Qator raqamlarini ko'rsatish
vim.wo.relativenumber = true -- Masofaviy raqamlar (tez sakrash uchun qulay)

-- =============================================================================
-- INDENT SETTINGS (2 talik Tab - Frontend standartlari)
-- =============================================================================
vim.opt.tabstop = 2 -- 1 ta Tab 2 ta probel kengligida ko'rinadi
vim.opt.softtabstop = 2 -- Tahrirlashda Tab 2 ta probeldek ishlaydi
vim.opt.shiftwidth = 2 -- Avtomatik chekinish 2 ta probel
vim.opt.expandtab = true -- Tab bosilganda haqiqiy probellarni qo'yadi
vim.opt.smartindent = true -- Yangi qatorda kodni aqlli surish
vim.opt.autoindent = true -- Oldingi qator chekinishini saqlash

-- =============================================================================
-- MOUSE & CLIPBOARD
-- =============================================================================
vim.opt.mouse = "a" -- Sichqonchani hamma rejimda yoqish
vim.opt.mousefocus = true -- Sichqoncha bor joyga fokus
vim.opt.clipboard = "unnamedplus" -- Tizim clipboardi bilan ishlash (Copy/Paste)

-- =============================================================================
-- SEARCH SETTINGS (VS Code kabi aqlli qidiruv)
-- =============================================================================
vim.opt.ignorecase = true -- Qidiruvda katta-kichik harfga qaramaslik
vim.opt.smartcase = true -- Agar katta harf yozsangiz, qidiruv qat'iylashadi
vim.opt.hlsearch = false -- Qidiruv tugagach, sarg'ayib turishni o'chirish

-- =============================================================================
-- VISUALS & UI (Ko'rinish)
-- =============================================================================
vim.opt.scrolloff = 8 -- Kursorni pastga/tepaga yetmasdan ekranni surish
vim.opt.wrap = false -- Uzun qatorlarni pastga tushirmaslik (gorizontal scroll)
vim.opt.termguicolors = true -- 24-bit ranglarni qo'llab-quvvatlash
vim.opt.cursorline = true -- Turgan qatorni yoritish
vim.opt.signcolumn = "yes" -- Xatolik belgilari uchun chapda joy ajratish
vim.opt.laststatus = 3 -- Global status line (pastki chiziq bitta bo'ladi)

-- =============================================================================
-- SPLITS (Oynalarni boshqarish)
-- =============================================================================
vim.opt.splitright = true -- Yangi oyna o'ngdan ochiladi
vim.opt.splitbelow = true -- Yangi oyna pastdan ochiladi

-- =============================================================================
-- FILLCHARS (Sizning chiroyli belgilar sozlamangiz)
-- =============================================================================
vim.opt.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- Fayl oxiridagi ~ belgilarini o'chirish
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- =============================================================================
-- OTHER CONVENIENCES
-- =============================================================================
vim.opt.updatetime = 250 -- LSP va plaginlar tezroq ishlashi uchun (default 4000)
vim.opt.timeoutlen = 300 -- Klaviatura kombinatsiyalarini kutish vaqti
vim.opt.undofile = true -- Neovim yopilib ochilsa ham "Undo" saqlanib qoladi

-- Diagnostika (Eslint xatolari) sozlamalari
vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Xato oldidagi belgi
		source = "if_many", -- Qaysi linterdan ekanini ko'rsatadi (eslint)
	},
	float = {
		border = "rounded",
		source = "always",
	},
	-- PurpleSchool kabi yozish jarayonida xatoni ko'rsatish:
	update_in_insert = true,
	underline = true,
	severity_sort = true,
})
