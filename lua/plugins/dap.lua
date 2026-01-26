return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mxsdev/nvim-dap-vscode-js",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- 1. OS va Yo'llarni aniqlash
			local is_windows = vim.loop.os_uname().version:find("Windows")
			local home = is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
			local debugger_path = home .. "/.local/share/nvim/vscode-js-debug"

			-- 2. Adapterlar (Node.js va PHP)
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { debugger_path .. "/dist/src/vsDebugServer.js", "${port}" },
				},
			}

			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { home .. "/.local/share/nvim/vscode-php-debug/out/phpDebug.js" },
			}

			-- 3. NestJS / NextJS Konfiguratsiyasi
			local node_config = {
				{
					type = "pwa-node",
					request = "attach",
					name = "NestJS: Attach to 9229",
					address = "localhost",
					port = 9229,
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
			}
			dap.configurations.typescript = node_config
			dap.configurations.javascript = node_config

			-- 4. Laravel (PHP) Konfiguratsiyasi
			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Listen for Xdebug",
					port = 9003,
					pathMappings = {
						["/var/www/html"] = "${workspaceRoot}",
					},
				},
			}

			-- 5. Avtomatik UI Listenerlar
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- 6. Keymaplar
			local keymap = vim.keymap.set
			keymap("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			keymap("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			keymap("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			keymap("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
			keymap("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			keymap("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Conditional Breakpoint" })
			keymap("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
			-- 1. Logpoint qo'yish
			keymap("n", "<leader>dl", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log xabari: "))
			end, { desc = "Debug: Logpoint qo'yish" })

			-- 2. Faqat loglarni (REPL) suzuvchi oynada ochish (Siz so'ragan leader dr)
			keymap("n", "<leader>dr", function()
				dapui.float_element("repl", { width = 100, height = 20, enter = true })
			end, { desc = "Debug: Faqat Loglarni ko'rish" })

			-- 3. Kursor turgan o'zgaruvchi qiymatini ko'rish (Siz so'ragan kursor kelganda ochilish)
			keymap("n", "<leader>di", function()
				dapui.eval() -- Bu kursor ostidagi o'zgaruvchini kichik oynada ko'rsatadi
			end, { desc = "Debug: Kursor ostidagi o'zgaruvchi" })
		end,
	},
}
