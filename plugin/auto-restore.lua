vim.api.nvim_create_autocmd("User", {
	pattern = "LazyDone",
	callback = require("auto-restore").restore,
})
