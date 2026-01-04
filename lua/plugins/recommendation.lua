return {
	-- HTML/React teglarni avtomatik yopish
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- Qavslarni avtomatik yopish
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Tailwind CSS ranglarini kodda ko'rsatish
	{
		"NvChad/nvim-colorizer.lua",
		opts = { user_default_options = { tailwind = true } },
	},

	-- TODO kommentlarni boshqarish
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
