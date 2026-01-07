return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "BufRead",
		config = function()
			-- Strelkalarni chiroyli qilish
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})

			-- Klaviaturada oson boshqarish (Option/Alt + f yopish/ochish)
			vim.keymap.set("n", "<A-f>", "za", { desc = "Kodni yopish/ochish" })
		end,
	},
}
