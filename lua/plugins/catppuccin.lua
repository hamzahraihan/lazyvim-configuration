return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
        },
        no_italic = false,
        no_bold = false,
        styles = {
            comments = { "italic" },
            functions = { "bold" },
            keywords = { "italic" },
            operators = { "bold" },
            conditionals = { "bold" },
            loops = { "bold" },
            booleans = { "bold", "italic" },
            numbers = {},
            types = { "bold" },
            strings = {},
            variables = {},
            properties = {},
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          dap = true,
          dap_ui = true,
          diffview = true,
          dropbar = { enabled = true, color_mode = true },
          fidget = true,
          flash = true,
          fzf = true,
          gitsigns = true,
          grug_far = true,
          hop = true,
          indent_blankline = { enabled = true, colored_indent_levels = true },
          lsp_saga = true,
          lsp_trouble = true,
          markdown = true,
          mason = true,
          mini = { enabled = true, indentscope_color = "" },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          notify = true,
          nvimtree = true,
          rainbow_delimiters = true,
          render_markdown = true,
          semantic_tokens = true,
          telescope = { enabled = true, style = "nvchad" },
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
        color_overrides = {
          mocha = {
              rosewater = "#f5e0dc",
              flamingo = "#f2cdcd",
              pink = "#f5c2e7",
              mauve = "#cba6f7",
              red = "#f38ba8",
              maroon = "#eba0ac",
              peach = "#fab387",
              yellow = "#f9e2af",
              green = "#a6e3a1",
              teal = "#94e2d5",
              sky = "#89dceb",
              sapphire = "#74c7ec",
              blue = "#89b4fa",
              lavender = "#b4befe",
              text = "#cdd6f4",
              subtext1 = "#bac2de",
              subtext0 = "#a6adc8",
              overlay2 = "#9399b2",
              overlay1 = "#7f849c",
              overlay0 = "#6c7086",
              surface2 = "#585b70",
              surface1 = "#45475a",
              surface0 = "#313244",
              base = "#1e1e2e",
              mantle = "#181825",
              crust = "#11111b",
          }
        },
        custom_highlights = function(colors)
            return {
              ["@string"] = { fg = colors.yellow },
              ["@function"] = { fg = colors.blue },
              ["@comment"] = { fg = colors.overlay1, style = { "italic" } },
              ["@misc"] = { fg = colors.red }
              -- Add more as needed
            }
        end
      })

      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
        end
      end,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin",
  --   },
  -- },
}
