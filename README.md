# Better Config for Neovim Terminal

This is a simple plugin of neovim that prvoides some preset configuration for terminal.

## What can it do?

1. Use `<ESC>` to switch to NORMAL mode as if you were editing a general file.
2. Use `<C-w>` + key (`h`, `j`. `k`, `l` and so on) to switch window as if you were in a general window.
3. Automatically enter the TERMINAL mode when you enter the terminal.
4. Dont't show the line number when in TERMINAL mode or the terminal window loses focus.
5. You can set terminal to show line numbers or not when in NORMAL mode.

## Requirement

- Neovim >= 0.7.2

## Configuration

For [packer](https://github.com/wbthomason/packer.nvim) user:

```lua
require('packer').startup(function(use)
  use {
    'h-hg/BetterTermConfig.nvim',
    config = function()
      require('bettertermconfig').setup {
        -- write your configuration here
      }
    end
  }
end)
```

The default configuration

```lua
{
  keymap = {
    esc = true, -- whether use <ESC> to switch to NORMAL mode
    cw = true,  -- whether use <C-w> + key to switch window
  },
  normal = {
    nu = true, -- whether show line number of terminal in NORMAL mode
    rnu = true,-- whether show relative line number of terminal in NORMAL mode
  },
}
```
