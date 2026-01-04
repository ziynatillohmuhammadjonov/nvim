return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				php = { "pint", "php_cs_fixer", stop_after_first = true },
				blade = { "blade-formatter" },
			},
			-- FORMAT ON SAVE:
			format_on_save = {
				timeout_ms = 1000, -- 3 soniya yetarli
				lsp_format = "fallback",
			},
		},
	},
}
