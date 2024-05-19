# auto-restore.nvim

This plugin loops over `lazy-lock.json` and checks whether each repo `HEAD` sha is equal
to the lockfile commit sha, if it is not, it calls `require("lazy").restore()` on that plugin

## Install

Supports only lazy plugin manager

```
require("lazy").setup({
    "Tronikelis/auto-restore.nvim"
})
```
