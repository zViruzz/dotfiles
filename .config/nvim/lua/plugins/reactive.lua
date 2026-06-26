return {
  {
    "rasulomaroff/reactive.nvim",
    config = function()
      local reactive = require("reactive")
      reactive.add_preset({
        name = "default",
        init = function()
          -- making our cursor to use `MyCursor` highlight group
          vim.opt.guicursor:append("a:MyCursor")
          vim.opt.cursorline = true

          -- Configure colors of cursorline and colorcolumn
          vim.cmd([[
                    hi! ColorColumn guifg=Red guibg='#380000'
                    hi! CursorLine guibg=#021020
                    hi! CursorLineNr gui=bold
                    ]])
        end,
        lazy = false,
        priority = 100,
        modes = {
          n = {
            winhl = {
              -- we use `winhl` because we want to highlight CursorLine only in a current window, not in all of them
              -- if you want to change global highlights, use the `hl` field instead.
              CursorLine = { bg = "#0e0e0e" },

              CursorLineNr = { bg = "#0e0e0e" },
            },
          },
          no = {
            -- You can also specify winhl and hl that will be applied with every operator
            winhl = {},
            hl = {},
            operators = {
              [{ "gu", "gU", "g~", "~" }] = {
                winhl = {
                  CursorLine = { bg = "#334155" },
                  CursorLineNr = { fg = "#cbd5e1", bg = "#334155" },
                },
              },
              -- change
              c = {
                winhl = {
                  CursorLine = { bg = "#162044" },
                  CursorLineNr = { fg = "#93c5fd", bg = "#162044" },
                },
              },
              -- delete
              d = {
                winhl = {
                  CursorLine = { bg = "#350808" },
                  CursorLineNr = { fg = "#fca5a5", bg = "#350808" },
                },
              },
              -- yank
              y = {
                winhl = {
                  CursorLine = { bg = "#422006" },
                  CursorLineNr = { fg = "#fdba74", bg = "#422006" },
                },
              },
            },
          },
          i = {
            winhl = {
              CursorLine = { bg = "#042f2e" },
            },
            hl = {
              MyCursor = { bg = "#5eead4" },
            },
          },
          c = {
            winhl = {
              CursorLine = { bg = "#202020" },
              CursorLineNr = { fg = "#ffffff", bg = "#303030" },
            },
          },
          [{ "v", "V", "\x16" }] = {
            winhl = {
              CursorLineNr = { fg = "#d8b4fe" },
              Visual = { bg = "#3b0764" },
            },
          },
          -- select
          [{ "s", "S", "\x13" }] = {
            winhl = {
              CursorLineNr = { fg = "#c4b5fd" },
              Visual = { bg = "#2e1065" },
            },
          },
          -- replace
          R = {
            winhl = {
              CursorLine = { bg = "#083344" },
              CursorLineNr = { fg = "#67e8f9", bg = "#083344" },
            },
          },
        },
      })
    end,
  },
}
