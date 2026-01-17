return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				json = { "prettier", stop_after_first = true },
				css = { "prettier", stop_after_first = true },
				html = { "prettier", stop_after_first = true },
				php = { "pint", "php_cs_fixer", stop_after_first = true },
				blade = { "blade-formatter" },
			},
			formatters = {
				prettier = {
					-- Windowsda node_modules ichidagi prettierni topishni osonlashtiramiz
					command = "prettier",
					-- Fayl yo'lini qavslari bilan birga PowerShell orqali xatosiz uzatadi
					args = { "--stdin-filepath", "$FILENAME" },
				},
			},
			format_on_save = {
				timeout_ms = 3000, -- Windowsda Prettier biroz sekinroq ishlashi mumkin
				lsp_format = "fallback",
			},
		},
	},
}
