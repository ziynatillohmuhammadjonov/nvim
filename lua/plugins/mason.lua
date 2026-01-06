return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-tool-installer").setup({
				-- auto_update = true, -- Paketlarni avtomat yangilab turish
				run_on_start = true,
				ensure_installed = {
					-- LSP Serverlari
					"lua-language-server", -- "lua_ls" o'rniga to'liq nomini yozib ko'ring
					"typescript-language-server", -- "ts_ls" o'rniga
					"intelephense",
					"html-lsp",
					"css-lsp",
					"tailwindcss-language-server",
					"emmet-ls",
					"eslint-lsp",

					-- Formatters
					"stylua",
					"prettierd",
					"prettier",
					--					"pint",
					"blade-formatter",
					"eslint_d",
				},
			})

			-- Xatolikni oldini olish uchun bazani yangilashni buyuramiz
			vim.defer_fn(function()
				require("mason-registry").refresh()
			end, 100)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"intelephense",
					"html",
					"cssls",
					"tailwindcss",
					"eslint",
				},
			})
		end,
	},
}
