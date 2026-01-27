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

-- Loyiha papkasiga avtomatik o'tish (To'g'rilangan variant)
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local path = vim.api.nvim_buf_get_name(0)

		-- Bo'sh fayllar, temporary fayllar yoki node_modules bo'lsa ishlamaslik
		if path == "" or path:match("node_modules") or path:match("term://") then
			return
		end

		-- Loyiha ildizini aniqlovchi fayllar
		local root_patterns = { ".git", "package.json", "composer.json", "nx.json", "turbo.json" }

		local root_file = vim.fs.find(root_patterns, {
			upward = true,
			path = vim.fs.dirname(path),
		})[1]

		if root_file then
			local root_dir = vim.fs.dirname(root_file)

			-- Windowsda D:/ kabi rootga chiqib ketmasligini tekshirish
			-- Agar root_dir faqat disk nomi bo'lib qolsa (masalan "D:/"), o'tmaymiz
			if root_dir:len() <= 3 and vim.fn.has("win32") == 1 then
				return
			end

			if root_dir ~= vim.fn.getcwd() then
				vim.fn.chdir(root_dir)
				-- Qayerga o'tganini bildirish (ixtiyoriy)
				-- print("Root changed to: " .. root_dir)
			end
		end
	end,
})

vim.opt.updatetime = 100 -- Kontekstni tezroq aniqlash uchun

-- Kodni yig'ish (Folding) sozlamalari
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:treesitter.foldexpr()"
vim.opt.foldlevel = 99 -- Faylni ochganda hamma narsa ochiq tursin
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1" -- Chap tomonda VS Code-dagidek ustun chiqarish

-- Windowsda Git Bash (bash.exe) ishlatsangiz yo'llarni to'g'ri o'qishi uchun
if vim.fn.has("win32") == 1 then
	vim.opt.shellslash = true
end

-- init.lua ichiga qo'shish uchun:
vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		if vim.fn.has("win32") == 1 then
			os.execute("taskkill /f /im node.exe /t")
		end
		-- Linux uchun shart emas, chunki WSL terminal yopilganda processlarni o'zi tozalaydi
	end,
})
-- Set the background of the main editor and floating windows to none (transparent)
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")

-- init.lua faylingizning oxiriga
vim.defer_fn(function()
	vim.cmd("colorscheme gruvbox")
end, 100)

vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapStopped",
	{ text = "▶️", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
)
