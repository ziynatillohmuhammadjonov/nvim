return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" }, -- Fayl ochilganda ishga tushadi
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				-- Next.js, NestJS, React, TS/JS uchun
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },

				-- Laravel (PHP) uchun
				-- phpstan - PHP xatolarini chuqur tekshirish uchun
				php = { "phpstan" },

				-- Boshqa tillar
				json = { "jsonlint" },
			}

			-- Kod yozayotganda yoki saqlaganda avtomatik tekshirish
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
