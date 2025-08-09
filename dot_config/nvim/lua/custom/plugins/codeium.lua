return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    -- Disabilita i keybinding di default se vuoi personalizzarli
    vim.g.codeium_disable_bindings = 1
    -- Keybindings personalizzati
    vim.keymap.set('i', '<C-g>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true })
    vim.keymap.set('i', '<C-;>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true })
    vim.keymap.set('i', '<C-,>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true })
    vim.keymap.set('i', '<C-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true })
  end,
}
