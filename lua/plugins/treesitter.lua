return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		config = function()
			local install = require("nvim-treesitter.install")

			local sysname = vim.loop.os_uname().sysname

			if sysname == "Windows_NT" then
				vim.env.CC = "gcc"
				vim.env.CXX = "g++"
				install.prefer_git = false
				install.compilers = { "gcc" }
			elseif sysname == "Linux" then
				-- WSL/Linuxda Windows CLI dasturlarini mutlaqo chetlab o'tish
				install.prefer_git = true
				install.compilers = { "gcc" }

				-- MUHIM: Agar PATHda Windowsning tree-sitter dasturi bo'lsa,
				-- uni ishlatmaslikni buyuramiz
				install.command_extra_args = {
					curl = { "--silent", "--fail" },
				}

				-- Agar tizimda tree-sitter CLI bo'lsa ham, uni ishlatishni taqiqlash
				-- Bu orqali Neovim faqat kompilyatorning o'zidan foydalanadi
				vim.g.tree_sitter_cli_path = ""
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
					"json",
					"jsonc",
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
	-- 2. Sticky Scroll (Context) plagini
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 5, -- JSON obyektlari chuqur bo'lgani uchun 5 qiling
				mode = "cursor",
			})

			-- JSON obyektlari ota-onasini ko'rsatish uchun rang
			vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#31353f" })
		end,
	},
}
