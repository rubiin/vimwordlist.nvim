Simple plugin that adds and dynamically updates spellcheck dictionary for vim and neovim keywords.
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

The plugin also exposes `GenerateVimSpell` user command that can be called to update the spell file manually.

Forked from https://github.com/norseghost/nvimwordlist as it was no longer working
