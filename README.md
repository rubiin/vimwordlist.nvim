WIP: DO NOT USE

## Installation


Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua

```lua
{

  {"rubiin/vimwordlist.nvim", version = "*",
    config = function()
      require("vimwordlist").update_spell_file()
      vim.opt.spelllang:append("vim")
    end
  }
}
```

Forked from https://github.com/norseghost/nvimwordlist as it was no longer working
