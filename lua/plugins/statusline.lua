return {
  'nvim-lualine/lualine.nvim', 
--[[  dependencies = {
    'nvim-tree/nvim-web-devicons',
    enabled = false,
  }, ]]--
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        --icons_enabled = true,
        icons_enabled = false,
      }, 
    })
  end,
}
