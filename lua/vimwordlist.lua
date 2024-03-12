local M = {}
local api, fn = vim.api, vim.fn

local function getcompletions()
  local to_complete = { "command", "option" }
  local completions = {}
  for _, subcomplete in pairs(to_complete) do
    for _, opt in pairs(fn.getcompletion("", subcomplete)) do
      for _, compl in pairs(fn.getcompletion(opt .. "", "cmdline")) do
        table.insert(completions, compl)
      end
    end
  end
end

local function getshortopts()
  local shortopts = {}
  local options = api.nvim_get_all_options_info()
  for _, option in pairs(options) do
    if option.shortname then
      table.insert(shortopts, option.shortname)
    end
  end
  return shortopts
end

local command_pattern = {
  "arglist",
  "augroup",
  "buffer",
  "breakpoint",
  "cmdline",
  "color",
  "command",
  "compiler",
  "diff_buffer",
  "dir",
  "environment",
  "event",
  "expression",
  "file_in_path",
  "filetype",
  "function",
  "help",
  "highlight",
  "history",
  "locale",
  "mapclear",
  "mapping",
  "menu",
  "messages",
  "option",
  "packadd",
  "runtime",
  "scriptnames",
  "shellcmd",
  "sign",
  "syntax",
  "syntime",
  "var",
}

local lists = {
  getshortopts(),
  getcompletions(),
}

for _, value in ipairs(command_pattern) do
  table.insert(lists, fn.getcompletion("", value))
end

function M.update_spell_file()
  local words = ""
  for _, list in pairs(lists) do
    for _, word in pairs(list) do
      words = words .. word .. "\n"
    end
  end

  local spell_dir = vim.fn.stdpath("config") .. "/spell"
  local word_file = spell_dir .. "/vimwords.word"

  local word_list = io.open(word_file, "w")

  if word_list then
    word_list:write(words)
    word_list:close()
    print(" Updated wordlist: " .. word_file)
    vim.cmd("mkspell! " .. spell_dir .. " " .. word_file)
    os.remove(word_file)
    os.rename(vim.fn.stdpath("config") .. "/spell.utf-8.spl", vim.fn.stdpath("config") .. "/spell/vim.utf-8.spl")
  else
    vim.notify("Error: Could not open file for writing: " .. word_file)
  end
end

return M
