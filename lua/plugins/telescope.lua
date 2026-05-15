return {
	{
		'nvim-telescope/telescope.nvim',
    event = 'VeryLazy', 
		dependencies = {
			{
				'nvim-lua/plenary.nvim',
				--lazy = false,
			},
		},
    keys = {
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'buffers' }, 
      { '<leader>fc', '<cmd>Telescope find_files cwd=~/.config/nvim/ hidden=true<CR>', desc = 'config files' }, 
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'find files' }, 
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'live grep' }, 
      { '<leader>fl', '<cmd>Telescope live_grep cwd=~/._/<CR>', desc = 'live grep in logs' }, 
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'help tags' }, 
      { '<leader>fr', '<cmd>Telescope oldfiles<CR>', desc = 'recent files' }, 
      { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'git status' }, 
      { '<leader>gl', '<cmd>Telescope git_commits<CR>', desc = 'git commit log' }, 
    },
    config = function()
      require('telescope').setup()
    end,
	},
}

