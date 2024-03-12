WIP: DO NOT USE

## Installation


Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua

```lua
{

  {"rubiin/vimwordlist.nvim", version = "*",
    build = function()
      require("vimwordlist").update_spell_file()
    end
    config = function()
        vim.opt.spelllang:append("vim")
    end
  }
}
```

Forked from https://github.com/norseghost/nvimwordlist as it was no longer working
