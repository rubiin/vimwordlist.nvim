vim.api.nvim_create_user_command("GenerateVimSpell", require("vimwordlist").update_spell_file, {})
