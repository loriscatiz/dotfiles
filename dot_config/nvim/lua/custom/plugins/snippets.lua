return {
  -- Engine per gli snippets
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = {
      -- Collezione di snippets predefiniti
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local luasnip = require 'luasnip'

      -- Carica gli snippets da friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_lua').lazy_load { paths = vim.fn.stdpath 'config' .. '/lua/custom/snippets' }
      -- Keybindings per navigare negli snippets
      vim.keymap.set({ 'i', 's' }, '<C-k>', function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { desc = 'Espandi o salta al prossimo placeholder' })

      vim.keymap.set({ 'i', 's' }, '<C-j>', function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { desc = 'Salta al placeholder precedente' })
    end,
  },

  -- Integrazione con nvim-cmp
  {
    'saadparwaiz1/cmp_luasnip',
    dependencies = { 'L3MON4D3/LuaSnip' },
  },
}
