-- return {
--   "monkoose/neocodeium",
--   event = "VeryLazy",
--   config = function()
--     local neocodeium = require("neocodeium")
--     neocodeium.setup()
--   end,
-- }
return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<A-f>",
          clear_suggestion = "<A-c>",
          accept_word = "<A-w>",
        },
        ignore_filetypes = { cpp = true }, -- or { "cpp", }
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info", -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end,
      })
    end,
  },
}
