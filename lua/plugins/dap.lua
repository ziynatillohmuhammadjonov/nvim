return {
	-- 1. Birinchi navbatda nvim-nio ni mustaqil plagin sifatida e'lon qilamiz
	{ "nvim-neotest/nvim-nio" },

	-- 2. Asosiy DAP konfiguratsiyasi
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio", -- Shunda ham bu yerda qolsin
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Mason-dap sozlamalari
			require("mason-nvim-dap").setup({
				ensure_installed = { "js-debug-adapter" },
				automatic_installation = true,
			})

			-- UI ni sozlash
			dapui.setup()

			-- Windows uchun adapter yo'lini to'g'irlash
			-- Mason js-debug-adapter'ni quyidagi papkaga o'rnatadi
			local adapter_path = vim.fn.stdpath("data")
				.. "/mason/packages/js-debug-adapter/extension/dist/src/vsDebugServer.js"

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { adapter_path, "${port}" },
				},
			}

			-- NestJS va NextJS tillari uchun konfiguratsiya
			local js_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

			for _, lang in ipairs(js_languages) do
				dap.configurations[lang] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "NestJS: Debug (NPM Start:Debug)",
						runtimeExecutable = "npm",
						runtimeArgs = { "run", "start:debug" },
						rootPath = "${workspaceFolder}",
						sourceMaps = true,
						console = "integratedTerminal",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "NextJS: Debug (NPM Dev)",
						runtimeExecutable = "npm",
						runtimeArgs = { "run", "dev" },
						rootPath = "${workspaceFolder}",
						sourceMaps = true,
						console = "integratedTerminal",
					},
				}
			end

			-- Avtomatik UI amallari
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Keymaps
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end)
			vim.keymap.set("n", "<leader>b", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
}
