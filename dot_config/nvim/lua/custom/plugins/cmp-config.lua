return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp', -- <-- AGGIUNGI QUESTA DIPENDENZA
    'hrsh7th/cmp-buffer', -- <-- Opzionale ma utile
    'hrsh7th/cmp-path', -- <-- Opzionale ma utile
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Importante: ottieni le capabilities per i LSP
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Configura i LSP per usare le capabilities di cmp
    require('lspconfig').ts_ls.setup {
      capabilities = capabilities, -- <-- QUESTA RIGA È FUNDAMENTALE
    }
    -- Aggiungi anche per altri LSP se necessario
    require('lspconfig').pyright.setup {
      capabilities = capabilities,
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'codeium' },
      }, {
        { name = 'buffer' },
        { name = 'path' }, -- <-- Aggiungi path
      }),
      mapping = cmp.mapping.preset.insert {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
      },
    }
  end,
}
