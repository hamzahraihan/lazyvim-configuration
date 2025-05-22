return {
  -- Laravel Blade support
  {
    "jwalton512/vim-blade",
    lazy = false,
    ft = { "blade", "blade.php" },
  },

  -- Laravel-specific language server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configure Intelephense with better Laravel support
        intelephense = {
          filetypes = { "php", "blade", "blade.php" },
          settings = {
            intelephense = {
              files = {
                associations = { "*.php", "*.blade.php" }, -- Include blade files
                maxSize = 5000000,
              },
              environment = {
                includePaths = { "vendor" }, -- Include Laravel vendor dir
              },
              hints = {
                parameterTypeHints = true,
                variableTypeHints = true,
                propertyTypeHints = true,
                returnTypeHints = true,
              },
              completion = {
                fullyQualifyGlobalConstantsAndFunctions = false,
                insertUseDeclaration = true,
                maxItems = 100,
              },
              diagnostics = {
                run = "onType", -- Update diagnostics while typing
              },
            },
          },
        },
      },
    },
  },

  -- Laravel IDE Helper integration
  {
    "LazyVim/LazyVim",
    opts = {
      -- Add Laravel-specific keymaps
      mappings = {
        n = {
          ["<leader>cl"] = { 
            "<cmd>!php artisan ide-helper:generate<CR><cmd>!php artisan ide-helper:models -N<CR>", 
            desc = "Run Laravel IDE Helper" 
          },
        },
      },
    },
  },
}
