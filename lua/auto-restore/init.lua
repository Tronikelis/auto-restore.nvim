local M = {}

function M.setup()
	local lockfile_path = vim.fn.stdpath("config") .. "/lazy-lock.json"

	local lockfile_contents = table.concat(vim.fn.readfile(lockfile_path))
	local lockfile_table = vim.json.decode(lockfile_contents)

	local function lazy_done()
		for plugin, meta in pairs(lockfile_table) do
			local commit = meta.commit
			local path = vim.fn.stdpath("data") .. "/lazy/" .. plugin

			if vim.fn.isdirectory(path) == 0 then
				return
			end

			vim.fn.jobstart("git rev-parse HEAD", {
				cwd = path,
				stdout_buffered = true,
				on_stdout = function(chan_id, stdout)
					stdout = stdout[1]

					if commit == stdout then
						return
					end

					require("lazy").restore({
						plugins = { plugin },
						show = true,
					})
				end,
			})
		end
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyDone",
		callback = lazy_done,
	})
end

return M
