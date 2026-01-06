return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			-- Neovim 0.11+ uchun majburiy
			vim.g.skip_ts_context_commentstring_module = true

			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				if option == "commentstring" then
					-- Treesitter orqali joriy tugunni (node) tekshiramiz
					local node = require("ts_context_commentstring.internal").calculate_commentstring()
					if node then
						return node
					end

					-- AGAR STILL NILL BO'LSA (Majburiy fallback)
					-- Fayl turi tsx bo'lsa, kursor qayerda bo'lishidan qat'iy nazar
					-- biz uni return() ichida deb faraz qilib ko'ramiz
					if filetype == "typescriptreact" then
						return "{/* %s */}"
					end
				end
				return get_option(filetype, option)
			end
		end,
	},
}
