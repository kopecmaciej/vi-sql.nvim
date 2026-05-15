# Vi SQL nvim plugin

**Vi SQL** is a TUI application for managing SQL databases (PostgreSQL, SQLite, MySQL).
This repository contains a Neovim plugin that provides a floating window interface for Vi SQL.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "kopecmaciej/vi-sql.nvim",
  config = function()
    require("vi-sql").setup()
  end,
  cmd = { "ViSQL" },
  keys = {
    { "<leader>vs", "<cmd>ViSQL<cr>", desc = "ViSQL" }
  }
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'kopecmaciej/vi-sql.nvim',
    config = function()
        require('vi-sql').setup()
    end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kopecmaciej/vi-sql.nvim'
```

Then run `:PlugInstall` in Neovim.

## Usage

Open the Vi SQL window with:

```
:ViSQL
```

## Configuration

```lua
require("vi-sql").setup({
    -- Keep the buffer alive when the window is closed (default: false)
    persist = false,

    -- Auto-connect to a named connection on open (default: nil)
    connection = nil,

    -- Floating window size as a fraction of the editor (default: 0.9)
    width = 0.9,
    height = 0.9,
})
```

### Example with a default connection

```lua
require("vi-sql").setup({
    persist = true,
    connection = "my-postgres",
})
```

## Requirements

- Neovim 0.5 or later
- `curl` (used for auto-install)
- `vi-sql` CLI — if not found in PATH, the plugin will offer to install it automatically via the official install script
