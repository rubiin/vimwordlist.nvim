
local util = require("spell")
vim.api.nvim_create_user_command('UpdateVimSpell', util.update_spell_file, { desc="hhha"})


