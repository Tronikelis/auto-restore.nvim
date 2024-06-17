# auto-restore.nvim

> [!WARNING]
> Just use `:Lazy restore`, I made this before knowing that that command exists

This plugin loops over `lazy-lock.json` and checks whether each repo `HEAD` sha is equal
to the lockfile commit sha, if it is not, it calls `require("lazy").restore()` on that plugin

## Install

Supports only lazy plugin manager

```lua
require("lazy").setup({
    {
        "Tronikelis/auto-restore.nvim",
        event = "VeryLazy",
    }
})
```
