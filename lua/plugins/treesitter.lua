return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		config = function()
			-- BU MUHIM: install'ni chaqirishdan oldin global o'zgaruvchini belgilaymiz
			vim.g.tree_sitter_cli_path = ""

			local install = require("nvim-treesitter.install")
			local sysname = vim.loop.os_uname().sysname

			if sysname == "Windows_NT" then
				vim.env.CC = "gcc"
				vim.env.CXX = "g++"
				install.prefer_git = false
				install.compilers = { "gcc" }
			elseif sysname == "Linux" then
				install.prefer_git = true
				install.compilers = { "gcc" }
				-- CLI topilmasa, tar/curl ishlatishni majburlaymiz
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

				------------------------------------------------
				-- 🧠 Incremental Selection
				------------------------------------------------
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						node_decremental = "grm",
						scope_incremental = "grc",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Avtomatik ravishda keyingi obyekni qidiradi
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- Jump listga qo'shadi (Ctrl+o bilan qaytsa bo'ladi)
						goto_next_start = {
							["]m"] = "@function.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
						},
					},
				},
			})
			-- 3. Folding va Filetype Mapping (Setupdan tashqarida bo'lishi mumkin)
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldlevel = 99

			vim.filetype.add({
				extension = { ["blade.php"] = "php" },
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
