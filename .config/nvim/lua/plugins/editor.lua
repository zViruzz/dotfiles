return {
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },

  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope").extensions.live_grep_args
          builtin.live_grep_args()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "<Leader>sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = function(_, opts)
  --     local actions = require("telescope.actions")
  --
  --     opts.defaults = {
  --       path_display = { "smart" }, -- Display paths smartly
  --       file_ignore_patterns = {
  --         "node_modules",
  --         "package-lock.json",
  --         "yarn.lock",
  --         "bun.lockb",
  --       },
  --       prompt_prefix = "> ", -- Set the prompt to just ">"
  --       layout_strategy = "horizontal", -- Use horizontal layout
  --       sorting_strategy = "ascending",
  --
  --       winblend = 0, -- No transparency
  --       results_title = false, -- Remove the "Results" title
  --
  --       -- borderchars = {
  --       --   prompt = { "─", " ", " ", " ", " ", " ", " ", " " }, -- Top border for the prompt only
  --       --   results = { " ", " ", " ", " ", " ", " ", " ", " " }, -- No borders for results
  --       --   preview = { "─", "│", " ", "│", "╭", "╮", "", "" }, -- Borders for the preview (top and sides)
  --       -- },
  --       mappings = {
  --         i = {
  --           ["<C-Down>"] = actions.cycle_history_next,
  --
  --           ["<C-Up>"] = actions.cycle_history_prev,
  --           ["<C-f>"] = actions.preview_scrolling_down,
  --
  --           ["<C-b>"] = actions.preview_scrolling_up,
  --         },
  --         n = {
  --           ["q"] = actions.close,
  --         },
  --       },
  --     }
  --
  --     -- Load the fzf extension for fast searches
  --     require("telescope").load_extension("fzf")
  --
  --     -- Add hidden files and no-ignore options to file search and live_grep
  --     opts.pickers = {
  --       find_files = {
  --         find_command = { "rg", "--files", "--hidden", "--no-ignore", "--iglob", "!.git/" },
  --       },
  --       live_grep = {
  --         additional_args = function()
  --           return { "--hidden", "--no-ignore" }
  --         end,
  --       },
  --     }
  --     return opts
  --   end,
  --
  --   dependencies = {
  --     {
  --       "nvim-telescope/telescope-live-grep-args.nvim",
  --       version = "^1.0.0",
  --       config = function()
  --         require("telescope").load_extension("live_grep_args")
  --       end,
  --     },
  --     {
  --       "nvim-telescope/telescope-fzf-native.nvim",
  --       build = "make",
  --       config = function()
  --         require("telescope").load_extension("fzf")
  --       end,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("telescope").setup(opts)
  --
  --     vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
  --   end,
  -- },

  {
    "akinsho/bufferline.nvim",
    enabled = false, -- Disable this plugin
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- exclude a filetype from the default_config
          filetypes_exclude = { "markdown" },
          -- add additional filetypes to the default_config
          filetypes_include = {},
          -- to fully override the default_config, change the below
          -- filetypes = {}
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = LazyVim.lsp.get_raw_config("tailwindcss")
          opts.filetypes = opts.filetypes or {}

          -- Add default filetypes
          vim.list_extend(opts.filetypes, tw.default_config.filetypes)

          -- Remove excluded filetypes
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, opts.filetypes)

          -- Additional settings for Phoenix projects
          opts.settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
                },
              },
              includeLanguages = {
                elixir = "html-eex",
                eelixir = "html-eex",
                heex = "html-eex",
              },
            },
          }

          -- Add additional filetypes
          vim.list_extend(opts.filetypes, opts.filetypes_include or {})
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- or you can return new options to override all the defaults
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return {
  --       --[[add your custom lualine config here]]
  --     }
  --   end,
  -- },
}
