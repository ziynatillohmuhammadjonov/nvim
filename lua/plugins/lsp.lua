return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = "LSP: " .. desc })
					end

					-- --- NAVIGATSIYA ---

					-- Funksiya yoki o'zgaruvchi yozilgan joyga sakrash (Definition)
					map("n", "gd", function()
						if _G.Snacks then
							Snacks.picker.lsp_definitions()
						else
							vim.lsp.buf.definition()
						end
					end, "Ta'rifga o'tish (Definition)")

					-- Bu funksiya qayerlarda ishlatilganini ro'yxatda ko'rish (References)
					map("n", "gr", function()
						if _G.Snacks then
							Snacks.picker.lsp_references()
						else
							vim.lsp.buf.references()
						end
					end, "Qayerda ishlatilganini ko'rish (References)")

					-- Interfeys amalga oshirilgan (Implementation) joyga o'tish
					map("n", "gi", function()
						if _G.Snacks then
							Snacks.picker.lsp_implementations()
						else
							vim.lsp.buf.implementation()
						end
					end, "Amalga oshirilgan joyga o'tish (Implementation)")

					-- Tur ta'rifiga o'tish (Type Definition)
					map("n", "gt", function()
						if _G.Snacks then
							Snacks.picker.lsp_type_definitions()
						else
							vim.lsp.buf.type_definition()
						end
					end, "Tur ta'rifiga o'tish (Type Definition)")

					-- E'lon qilingan (Declaration) joyga o'tish
					map("n", "gD", vim.lsp.buf.declaration, "E'lon qilingan joyga o'tish (Declaration)")

					-- --- MA'LUMOT VA TAHRIR ---

					-- Kursor ostidagi element haqida ma'lumot (Documentation)
					map("n", "K", vim.lsp.buf.hover, "Hujjatni ko'rish (Hover)")

					-- O'zgaruvchi nomini butun loyiha bo'ylab o'zgartirish
					map("n", "<Leader>lr", vim.lsp.buf.rename, "Nomni o'zgartirish (Rename)")

					-- Avtomatik tuzatishlar va tezkor amallar (Importlar, fixlar)
					map({ "n", "v" }, "<Leader>la", function()
						local snacks = require("snacks")
						if snacks.picker and (snacks.picker.lsp_code_actions or snacks.picker.lsp_actions) then
							local action = snacks.picker.lsp_code_actions or snacks.picker.lsp_actions
							action()
						else
							vim.lsp.buf.code_action()
						end
					end, "Tezkor amallar (Code Action)")

					-- Imlo va sintaksis xatolar ro'yxatini ko'rish (Diagnostics)
					map("n", "<Leader>ld", function()
						if _G.Snacks then
							Snacks.picker.diagnostics_buffer()
						else
							vim.diagnostic.setloclist()
						end
					end, "Fayl xatolarini ko'rish (Diagnostics)")

					-- Kodni formatlash (Conform ishlatilmasa buni ishlatsa bo'ladi)
					map("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, "Kodni formatlash")

					-- Kursor ostidagi xato haqida to'liq ma'lumot (Floating window)
					map("n", "gl", vim.diagnostic.open_float, "Xato tafsilotini ko'rish")
				end,
			})
		end,
	},
}
