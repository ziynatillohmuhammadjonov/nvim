return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		opts = {
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
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		},
		config = function(_, opts)
			-- Eski 'configs' modulini chaqirmasdan to'g'ridan-to'g'ri setup qilamiz
			-- Agar bu ham xato bersa, shunchaki opts-ni qoldiring
			local ok, configs = pcall(require, "nvim-treesitter.configs")
			if ok then
				configs.setup(opts)
			end

			-- JSX/TSX uchun majburiy start
			vim.api.nvim_create_autocmd({ "FileType" }, {
				pattern = { "typescriptreact", "javascriptreact" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
