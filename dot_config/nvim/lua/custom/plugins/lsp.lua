return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'html',
          'cssls',
          'emmet_ls',
          'pyright', -- per Python
          'golangls', -- per Go
        },
      }

      local lspconfig = require 'lspconfig'

      -- HTML LSP con support per Django templates
      lspconfig.html.setup {
        filetypes = { 'html', 'htmldjango' },
        init_options = {
          configurationSection = { 'html', 'css', 'javascript' },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
        },
      }

      -- Emmet per autocompletamento veloce
      lspconfig.emmet_ls.setup {
        filetypes = { 'html', 'htmldjango', 'css' },
      }
    end,
  },
}
