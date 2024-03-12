Simple plugin that add and dynamically updateable spellcheck dictionary for vim and neovim keywords.
## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua

```lua
{
{"rubiin/vimwordlist.nvim",
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
