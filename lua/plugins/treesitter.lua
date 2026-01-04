return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- config funksiyasi ichida xatolik chiqmasligi uchun mainni belgilaymiz
		config = function()
			-- Ba'zi versiyalarda modul nomi 'nvim-treesitter.configs'
			-- o'rniga to'g'ridan-to'g'ri 'nvim-treesitter.configs' deb chaqiriladi
			local status_ok, configs = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				return
			end

			configs.setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"typescript",
					"javascript",
					"php",
					"html",
					"css",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}
