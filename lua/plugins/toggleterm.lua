return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  keys = {
    { [[<c-t>]],  '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
    { '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'horizontal' }, 
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=60<cr>', desc = 'vertical' }, 
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'float' }, 
    { '<leader>t1', '<cmd>1ToggleTerm direction=horizontal<cr>', desc = 'host #1' }, 
    { '<leader>t2', '<cmd>2ToggleTerm direction=horizontal<cr>', desc = 'host #2' }, 
    { '<leader>t3', '<cmd>3ToggleTerm direction=horizontal<cr>', desc = 'host #3' }, 
    { '<leader>ts', '<cmd>4ToggleTerm direction=vertical size=60<cr>', desc = 'serial 0 #4' }, 
    { '<leader>tt', '<cmd>5ToggleTerm direction=vertical size=60<cr>', desc = 'serial 1 #5' }, 
  }, 
  config = function()
    require('toggleterm').setup({
      size = 20, 
--      open_mapping = [[<c-t>]], 
      hide_numbers = true, 
      shade_terminals = true, 
      shading_factor = 2,
      start_in_insert = true, 
      insert_mappings = true, 
      persist_size = true, 
      direction = 'horizontal', -- 'vertical' | ''window' | 'float'
--      direction = 'float', -- 'horizontal' | 'vertical' | ''window' | 'float'
      float_opts = {
--        border = 'rounded', 
        border = 'double', 
      }, 
      close_on_exit = true, 
      shell = vim.o.shell,
      hidden = true,
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<cmd>wincmd h<cr>]], opts)
      vim.keymap.set('t', '<C-j>', [[<cmd>wincmd j<cr>]], opts)
      vim.keymap.set('t', '<C-k>', [[<cmd>wincmd k<cr>]], opts)
      vim.keymap.set('t', '<C-l>', [[<cmd>wincmd l<cr>]], opts)
    end
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require('toggleterm.terminal').Terminal
    local serial_log = Terminal:new({
      cmd = 'cat /dev/ttyUSB0', 
      direction = 'float', 
      float_opts = {
        border = 'double', 
      }, 
      hidden = true, 
    })
    function _serial_log_toggle()
      serial_log:toggle()
    end
    vim.keymap.set('n', '<leader>tl', '<cmd>lua _serial_log_toggle()<cr>', { desc = 'serial logger', noremap = true, silent = true })

  end 
}
