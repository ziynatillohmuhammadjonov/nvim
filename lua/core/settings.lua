-- 1. Pluginni sozlash
require("ts_context_commentstring").setup({
	enable_autocmd = false,
	languages = {
		typescript = { __default = "// %s", __multiline = "/* %s */" },
		tsx = {
			__default = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
	},
})
-- 2. Xavfsiz get_option funksiyasi
local original_get_option = vim.filetype.get_option
vim.filetype.get_option = function(ft, option)
	-- Agar so'ralayotgan narsa commentstring bo'lsa
	if option == "commentstring" then
		-- ts_context_commentstring orqali tekshiramiz
		local ok, res = pcall(function()
			return require("ts_context_commentstring.internal").calculate_commentstring()
		end)

		if ok and res then
			return res
		end
	end

	-- Agar commentstring bo'lmasa yoki yuqoridagi xato bersa, standartni qaytaramiz
	-- Bu yerda 'ft' nil bo'lsa, xato bermasligi uchun tekshiruv qo'shamiz
	if not ft then
		ft = vim.bo.filetype
	end

	return original_get_option(ft, option)
end

-- Bu kod har qanday holatda ham ishlashini ta'minlaydi
local status_ok, ts_context = pcall(require, "ts_context_commentstring")
if status_ok then
	ts_context.setup({ enable_autocmd = false })

	local get_option = vim.filetype.get_option
	vim.filetype.get_option = function(ft, option)
		if option == "commentstring" then
			local cl = require("ts_context_commentstring.internal").calculate_commentstring()
			if cl then
				return cl
			end
		end
		return get_option(ft, option)
	end
end
