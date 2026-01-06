return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			-- MUHIM: Neovim ichki modulini chetlab o'tib, bizning funksiyamizni ishlatishga majburlaydi
			vim.g.skip_ts_context_commentstring_module = true

			local ts_context = require("ts_context_commentstring")

			ts_context.setup({
				enable_autocmd = false,
			})

			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				if option == "commentstring" then
					-- 1. Avval kontekstni hisoblashga harakat qiladi
					local res = require("ts_context_commentstring.internal").calculate_commentstring()
					if res then
						return res
					end

					-- 2. Zaxira qoidasi: Agar Treesitter javob bermasa (nil bo'lsa)
					if filetype == "typescriptreact" or filetype == "javascriptreact" then
						return "{/* %s */}"
					end
				end
				return get_option(filetype, option)
			end
		end,
	},
}
