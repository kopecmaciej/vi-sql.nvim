# vi-sql.nvim

Neovim plugin for [vi-sql](https://github.com/kopecmaciej/vi-sql) — a TUI client for SQL databases (PostgreSQL, SQLite, MySQL). Opens vi-sql in a floating window and keeps the session running in the background when toggled.

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim) (recommended)

```lua
{
  "kopecmaciej/vi-sql.nvim",
  config = function()
    require("vi-sql").setup()
  end,
  cmd = { "ViSQL", "ViSQLJump" },
  keys = {
    { "<leader>vs", "<cmd>ViSQL<cr>", desc = "Toggle vi-sql" },
    { "<leader>vj", ":ViSQLJump ", desc = "vi-sql jump to table", silent = false },
  },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'kopecmaciej/vi-sql.nvim',
    config = function()
        require('vi-sql').setup()
    end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kopecmaciej/vi-sql.nvim'
```

## Usage

| Command | Description |
|---|---|
| `:ViSQL` | Toggle the floating window (session keeps running when hidden) |
| `:ViSQLJump public/users` | Open and jump directly to a schema/table |

Inside the vi-sql window, press `<C-\><C-\>` to hide it without ending the session.

## Configuration

All options with their defaults:

```lua
require("vi-sql").setup({
    -- Auto-connect to a named connection on open
    connection = nil,

    -- Key to hide the window from inside vi-sql (terminal mode)
    toggle_key = "<C-\\><C-\\>",

    -- Floating window size as fraction of the editor
    width = 0.9,
    height = 0.9,
})
```

### Example

```lua
require("vi-sql").setup({
    connection = "my-postgres",
    toggle_key = "<C-q>",
})
```

## Requirements

- Neovim 0.5+
- `curl` — used for auto-install if `vi-sql` is not in PATH
- `vi-sql` — installed automatically on first use if missing
