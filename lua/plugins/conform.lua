return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- Faylni saqlashdan oldin avtomat ishlashi uchun
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Next.js, NestJS, React Native, Expo uchun (hammasi Prettier ishlatadi)
				--javascript = { "prettierd", "prettier", stop_after_first = true },
				--	typescript = { "prettierd", "prettier", stop_after_first = true },
				--	javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				-- 	typescriptreact = { "prettierd", "prettier" },
				javascript = { "prettier", "prettierd", stop_after_first = true },
				typescript = { "prettier", "prettierd", stop_after_first = true },
				javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				typescriptreact = { "prettier", "prettierd", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },

				-- Tailwind va CSS
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },

				-- Laravel (PHP) uchun
				-- 'pint' - Laravel uchun standart, 'blade-formatter' - .blade fayllar uchun
				php = { "pint", "php_cs_fixer", stop_after_first = true },
				blade = { "blade-formatter" },
			},

			-- Faylni saqlaganda avtomatik formatlash (Save on format)
			format_on_save = {
				timeout_ms = 10000, -- 10 soniya (Tailwind uchun zarur)			timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
