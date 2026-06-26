-- ~/.config/nvim/lua/plugins/transparent.lua

-- ever

-- return {}

return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- Cargar al inicio para evitar parpadeos
    priority = 1000, -- Cargar temprano, antes que los colorschemes
    config = function()
      local transparent = require("transparent")

      transparent.setup({
        groups = { -- grupos base que serán transparentes
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "Tree",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",

          -- Da error en lualine al separa contexto
          -- "StatusLine",
        },
        extra_groups = { -- grupos adicionales (plugins específicos)
          -- Floating windows
          "NormalFloat",
          "FloatBorder",

          -- Telescope
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "TelescopeResultsBorder",
          "TelescopePreviewBorder",

          -- Neo-tree / NvimTree
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NvimTreeNormal",

          -- Which-key
          "WhichKey",
          "WhichKeyFloat",

          -- Notify
          "NotifyBackground",

          -- Completion menu
          "Pmenu",
          "PmenuSel",
          "PmenuSbar",
          "PmenuThumb",
        },
        exclude_groups = {}, -- grupos que NO queremos transparentes

        -- Configuraciones adicionales
        enable = true, -- activar por defecto
      })

      -- Limpiar algunos prefijos específicos para plugins
      transparent.clear_prefix("BufferLine")
      transparent.clear_prefix("NeoTree")
      -- transparent.clear_prefix("lualine")
      -- transparent.clear_prefix("StatusLine")

      -- Opcional: Activar transparencia automáticamente
      vim.cmd("TransparentEnable")

      -- Keymaps opcionales para toggle rápido
      vim.keymap.set("n", "<leader>ut", "<cmd>TransparentToggle<CR>", { desc = "Toggle Transparency" })
    end,
  },
  -- ~/.config/nvim/lua/plugins/lualine.lua
}
