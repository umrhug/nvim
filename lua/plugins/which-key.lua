return {
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
--[[		dependencies = {
			{
				'nvim-mini/mini.icons',
				-- style = 'ascii',
			},
			{
				'nvim-tree/nvim-web-devicons',
				--enabled = vim.g.have_nerd_font
				enabled = false,
			},
		}, ]]--
    opts = {
      icons = { enabled = false, rules = false, },
    },
    keys = {
      {
        '?', 
        function()
          require('which-key').show({
            global = false, 
          }) 
        end, 
        desc = 'Buffer Local Keymaps (which-key)', 
      },
      { '<leader>bd', '<cmd>bdelete<cr>', desc='delete' }, 
      { '<leader>bD', '<cmd>bdelete!<cr>', desc='force delete' }, 
      { '<leader>mi', '<cmd>InitLua<cr>', desc='InitLua' }, 
      { '<leader>ml', '<cmd>MDown<cr>', desc='Open Markdown Logs' }, 
      { '<leader>mu', '<cmd>UpTerminal<cr>', desc='Byobu PopUp Terminal' }, 
    }, 
    config = function()
      require('which-key').setup({
        icons = {
          mappings = vim.g.have_nerd_font,
          keys = {
            Up = '<Up> ',
            Down = '<Down> ',
            Left = '<Left> ',
            Right = '<Right> ',
            C = '<C-...> ',
            M = '<M-...> ',
            D = '<D-...> ',
            S = '<S-...> ',
            CR = '<CR> ',
            Esc = '<Esc> ',
            ScrollWheelDown = '<ScrollWheelDown> ',
            ScrollWheelUp = '<ScrollWheelUp> ',
            NL = '<NL> ',
            BS = '<BS> ',
            Space = '<Space> ',
            Tab = '<Tab> ',
            F1 = '<Tab> ',
            F2 = '<F2> ',
            F3 = '<F3> ',
            F4 = '<F4> ',
            F5 = '<F5> ',
            F6 = '<F6> ',
            F7 = '<F7> ',
            F8 = '<F8> ',
            F9 = '<F9> ',
            F10 = '<F10> ',
            F11 = '<F11> ',
            F12 = '<F12> ',
          },
       },
        plugins = {
          spelling = { enabled = false },
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
          },
        },
      }) 
      require('which-key').add({
        { '<leader>f', group = 'find' }, 
        { '<leader>b', group = 'buffers', expand = function()
            return require('which-key.extras').expand.buf()
          end
        }, 
        { '<leader>g', group = 'git' }, 
        { '<leader>m', group = 'commands' }, 
        { '<leader>t', group = 'terminal' }, 
        { '<leader>w', proxy = '<c-w>', group = 'windows' },
        {
          mode = { 'n', 'v' }, 
          { '<leader>q', '<cmd>q<cr>', desc = 'quit' }, 
        },
--[[        {
          mode = { 'n' }, 
          { '<leader>w', '<cmd>w<cr>', desc = 'write' }, 
        },]]
       }) 
    end,
	},
}
