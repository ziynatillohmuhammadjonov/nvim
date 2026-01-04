return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- ENGI MUHIMI: Definition - Funksiya yozilgan joyga o'tish
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

					-- Declaration - E'lon qilingan joyga o'tish
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					-- Hover - Funksiya haqida ma'lumot chiqarish
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					-- Implementation - Interfeys amalga oshirilgan joy
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

					-- References - Bu funksiya qayerlarda ishlatilganini ko'rish
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

					-- Rename - O'zgaruvchi nomini hamma joyda o'zgartirish
					vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)

					-- Code Action - Avtomatik tuzatishlar (Import qo'shish va h.k.)
					vim.keymap.set({ "n", "v" }, "<Leader>la", function()
						local snacks = require("snacks")
						if snacks.picker and snacks.picker.lsp_code_actions then
							snacks.picker.lsp_code_actions()
						elseif snacks.picker and snacks.picker.lsp_actions then
							snacks.picker.lsp_actions() -- Ba'zi versiyalarda shunday nomlanadi
						else
							-- Agar picker topilmasa, standart LSP menyusiga qaytish (xato bermasligi uchun)
							vim.lsp.buf.code_action()
						end
					end, opts)
					--vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)

					-- Format - Kodni chiroyli qilish
					vim.keymap.set("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
