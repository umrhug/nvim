vim.cmd('autocmd!')
vim.scriptingencoding = 'utf-8'
vim.wo.number = true

-- share clipboard with os
vim.opt.clipboard:append('unnamedplus,unnamed')

-- call command to read nvim configuration file
vim.api.nvim_create_user_command(
	'InitLua',
	function()
		vim.cmd.edit(vim.fn.stdpath('config') .. '/init.lua')
	end,
	{ desc = 'Open init.lua' }
)
-- call command to memorize
vim.api.nvim_create_user_command(
  'OpenNotes',
  function()
    filename = os.date('%Y%m%d.md')
    vim.cmd('cd ~/.notes')
    vim.cmd.edit('~/.notes/' .. filename)
  end,
  { desc = 'Open today' .. "'s " .. 'markdown note.' }
)
-- call command to byobu popup
vim.api.nvim_create_user_command(
  'UpTerminal',
  function()
    vim.cmd('!byobu popup -E fish')
  end,
  { desc = 'Byobu popup command' }
)

-- virtual environment for python3
vim.g.python3_host_prog = vim.fn.expand(vim.fn.stdpath('data') .. '/venv/bin/python3')
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.g.have_nerd_font = false

