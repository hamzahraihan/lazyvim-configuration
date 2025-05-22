return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      default_format_opts = {
          timeout_ms = 100000,
      },

      -- Define a custom formatter for Pint
      formatters = {
        pint = {
          -- Use full paths to avoid ENOENT errors
          command = "C:\\Users\\Asep Saepuloh\\.config\\herd\\bin\\php.BAT", -- Use the path from your conform info
          args = { "C:\\laragon\\www\\laravel-blog\\vendor\\bin\\pint", "$FILENAME" },
          -- Don't use stdin as it might be causing issues
          stdin = false,
        },
      },
      formatters_by_ft = {
        blade = { "blade-formatter" },
        php = { "pint" }
      },
      -- -- Increase timeout for formatters
      -- format_on_save = {
      --   timeout_ms = 100000,
      --   lsp_fallback = true,
      -- },
    },
  },
  
  -- Disable null-ls for PHP formatting since we're using conform.nvim
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      local sources = opts.sources or {}
      
      -- Filter out any PHP formatters
      local new_sources = {}
      for _, source in ipairs(sources) do
        local is_php_formatter = source.filetypes and 
                                (vim.tbl_contains(source.filetypes, "php") or 
                                 vim.tbl_contains(source.filetypes, "blade"))
        
        -- Only keep non-PHP formatters
        if not is_php_formatter then
          table.insert(new_sources, source)
        end
      end
      
      opts.sources = new_sources
    end,
  },
  
  -- Rest of your configuration remains the same
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
  
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          filetypes = { "html", "blade", "blade.php" },
        },
        intelephense = {
          filetypes = { "php", "blade", "blade.php" },
        },
      },
    },
  },
  
  {
    "nvim-lspconfig",
    init = function()
      vim.filetype.add({
        extension = {
          blade = "blade",
          ["blade.php"] = "blade",
        },
      })
    end,
  },
  
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
    },
  },
  
  {
    "nvim-neotest/neotest",
    dependencies = { "V13Axel/neotest-pest" },
    opts = { adapters = { "neotest-pest" } },
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html",
        "blade",
        "php",
      })
    end,
    config = function(_, opts)
      vim.filetype.add({
        extension = {
          blade = "blade",
          ["blade.php"] = "blade",
        },
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end,
  },
}
