return {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        presets = {
          bottom_search = true, -- Enable bottom search view
          command_palette = true, -- Enable command palette view
          lsp_doc_border = true, -- Enable LSP documentation border
        },
        -- Uncomment the following lines to customize the cmdline popup view
        -- views = {
        --   cmdline_popup = {
        --     filter_options = {},
        --     win_options = {
        --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        --     },
        --   },
        -- },
      })
    end,
  },
  -- {
  --   "folke/noice.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.routes, {
  --       filter = {
  --         event = "notify",
  --         find = "No information available",
  --       },
  --       opts = { skip = true },
  --     })
  --     local focused = true
  --     vim.api.nvim_create_autocmd("FocusGained", {
  --       callback = function()
  --         focused = true
  --       end,
  --     })
  --     vim.api.nvim_create_autocmd("FocusLost", {
  --       callback = function()
  --         focused = false
  --       end,
  --     })
  --     table.insert(opts.routes, 1, {
  --       filter = {
  --         cond = function()
  --           return not focused
  --         end,
  --       },
  --       view = "notify_send",
  --       opts = { stop = false },
  --     })
  --
  --     opts.commands = {
  --       all = {
  --         -- options for the message history that you get with `:Noice`
  --         view = "split",
  --         opts = { enter = true, format = "details" },
  --         filter = {},
  --       },
  --     }
  --
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "markdown",
  --       callback = function(event)
  --         vim.schedule(function()
  --           require("noice.text.markdown").keys(event.buf)
  --         end)
  --       end,
  --     })
  --
  --     opts.lsp.hover = {
  --       enabled = true,
  --       silent = true,
  --       view = nil,
  --     }
  --     opts.presets.lsp_doc_border = true
  --   end,
  -- },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          --           header = [[
          --       ⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠠⠤⠐⠒⠒⢢⡗⠒⠒⠒⠒⠶⠤⠄⣀⡀⠀⠀⠀⠀⠀⠻⡄⠀
          --       ⠀⠀⢠⡞⠀⠀⠀⠀⠀⠀⠀⠀⠤⠀⠀⠉⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⠀⠀⠀⠀⠀⠀⣇⠉⠙⠲⢦⣄⡀⠀⢹⡄
          --       ⠀⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣟⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣆⠀⠀⠀⠈⠉⠷⣤⣷
          --       ⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⣄⠀⠀⠀⠀⠀⠈⢻
          --       ⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⠿⠿⠿⢿⣿⣿⡇⠀⠀⠀⠀⢀⣾⣿⣷⣾⣄⠀⠀⠀⠀⠀⠀
          --       ⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡏⠀⠀⠀⠀⠰⣝⣿⡇⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀
          --       ⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣧⣾⡇⢀⣦⢠⣿⣿⠃⠀⠀⢠⣾⣿⡟⠛⠛⠻⣿⣿⣷⠀⠀⠀⠀
          --       ⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣭⣿⣟⣾⣿⠏⠀⠀⣰⣿⣿⣿⡇⠀⠀⠀⢠⣻⡿⠀⠀⠀⠀
          --       ⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠘⣿⣿⣿⣿⣿⣿⣿⠋⠀⣠⣾⣿⣿⣿⣿⣷⣶⣠⣆⢸⣿⠃⠀⠀⠀⠀
          --       ⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣦⡹⣿⣿⣿⣿⡿⣃⣴⣿⣿⣿⣿⣿⣿⣿⣿⣽⣟⣯⣿⡟⠀⠀⠀⠀⢸
          --       ⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢀⠇
          --       ⠀⠠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⡜⠀
          --       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣽⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠰⠀⠀
          --       ⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⣠⣤⣄⠀⠀⠘⣶⣶⣶⣶⣾⣿⣿⣭⣿⣻⡿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀
          --       ⠀⠀⠀⠀⠀⠀⠈⠀⠀⠾⠷⠿⢿⣿⣷⣦⣀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀
          --       ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣭⣍⣉⡉⠛⠛⠻⠿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀
          --       ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀
          --       ⠀⠀⠀⠀⠀⠀⣿⣿⡿⣿⣻⣿⣿⣿⣿⣿⣿⣟⣛⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀
          --       ⠀⠀⠀⠀⠀⠀⠋⢡⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⢿⣛⣯⣶⢾⣯⢭⡿⡟⠻⠿⢿⣿⠁⠀⠀⠀⠀⠀⠀⠀
          -- ]],
          header = [[ 
	                                                                       
	        ████ ██████           █████      ██                      
	       ███████████             █████                              
	       █████████ ███████████████████ ███   ███████████    
	      █████████  ███    █████████████ █████ ██████████████    
	     █████████ ██████████ █████████ █████ █████ ████ █████    
	   ███████████ ███    ███ █████████ █████ █████ ████ █████   
	  ██████  █████████████████████ ████ █████ █████ ████ ██████  
	                                                                         
        ]],
        -- stylua: ignore
        -- @type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
      },
    },
  },
}
