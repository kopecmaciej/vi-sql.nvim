# vi-sql.nvim

Neovim plugin for [vi-sql](https://github.com/kopecmaciej/vi-sql) — a TUI client for SQL databases.
Opens vi-sql in a floating window and keeps the session alive in the background between visits.

## How it works

- **`:ViSQL`** opens vi-sql (or reopens it if a session is already running in the background)
- **`hide_key`** (configurable) hides the window from inside vi-sql without ending the session
- **`:ViSQLJump schema/table`** opens vi-sql and jumps directly to a table
- If `vi-sql` is not installed, the plugin offers to install it automatically via the official install script

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "kopecmaciej/vi-sql.nvim",
  config = function()
    require("vi-sql").setup({
      -- Press this inside vi-sql to hide the window (change to taste)
      hide_key = "<C-q>",
    })
  end,
  cmd = { "ViSQL", "ViSQLJump" },
  keys = {
    { "<leader>vs", "<cmd>ViSQL<cr>", desc = "Open vi-sql" },
    -- { "<leader>vj", ":ViSQLJump ", desc = "vi-sql: jump to table", silent = false },
  },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'kopecmaciej/vi-sql.nvim',
    config = function()
        require('vi-sql').setup({
            hide_key = "<C-q>",
        })
    end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kopecmaciej/vi-sql.nvim'
```

## Commands

| Command                   | Description                                          |
| ------------------------- | ---------------------------------------------------- |
| `:ViSQL`                  | Open vi-sql (or reopen a running background session) |
| `:ViSQLJump public/users` | Open vi-sql and jump to a schema/table               |

## Configuration

```lua
require("vi-sql").setup({
    -- Auto-connect to a named connection on open (default: nil)
    connection = nil,

    -- Key to hide the window from inside vi-sql without ending the session
    -- Set to nil to disable. Any key works; pick one that vi-sql doesn't use.
    hide_key = nil,

    -- Floating window size as a fraction of the editor (default: 0.9)
    width = 0.9,
    height = 0.9,
})
```

## Requirements

- Neovim 0.5+
- `curl` — used for auto-install if `vi-sql` is not found in PATH
- `vi-sql` — installed automatically on first use if missing
