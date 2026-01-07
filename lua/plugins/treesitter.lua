return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		config = function()
			local install = require("nvim-treesitter.install")

			if vim.loop.os_uname().sysname == "Windows_NT" then
				vim.env.CC = "gcc"
				vim.env.CXX = "g++"
				install.prefer_git = false
				install.compilers = { "gcc" }
			end

			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"typescript",
					"tsx",
					"javascript",
					"html",
					"css",
					"php",
					"php_only", -- PHP uchun parserlar
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})

			-- Blade fayllarini Treesitter orqali tanitish
			-- Blade parseri ko'pincha PHP va HTML parserlariga tayanadi
			vim.api.nvim_create_autocmd({ "FileType" }, {
				pattern = { "typescriptreact", "javascriptreact", "typescript", "javascript", "php" },
				callback = function(args)
					local lang = vim.bo[args.buf].filetype
					if lang == "typescriptreact" then
						lang = "tsx"
					end
					if lang == "javascriptreact" then
						lang = "javascript"
					end

					pcall(vim.treesitter.start, args.buf, lang)
				end,
			})
		end,
	},
}
