-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- vim.keymap.set("n", "<c-/>", function()
--   require("toggleterm").toggle()
-- end)

-- vim.keymap.set("n", "<c-/>", function()
--   require("toggleterm").toggle()
-- end)

-- Neocodeium
-- vim.keymap.set("i", "<A-f>", function()
--   require("neocodeium").accept()
-- end)
-- vim.keymap.set("i", "<A-w>", function()
--   require("neocodeium").accept_word()
-- end)
-- vim.keymap.set("i", "<A-a>", function()
--   require("neocodeium").accept_line()
-- end)
-- vim.keymap.set("i", "<A-e>", function()
--   require("neocodeium").cycle_or_complete()
-- end)
-- vim.keymap.set("i", "<A-r>", function()
--   require("neocodeium").cycle_or_complete(-1)
-- end)
-- vim.keymap.set("i", "<A-c>", function()
--   require("neocodeium").clear()
-- end)

---------------------------------------

vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end
