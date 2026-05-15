return {
  'akinsho/bufferline.nvim', 
  version = '*', 
--[[  dependencies = {
    'nvim-tree/nvim-web-devicons',
    enabled = false,
  },]]--
  opts = {
    options = {
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
  config = function()
    require('bufferline').setup({
      options = {
        mode = 'buffers', 
        separator_style = 'slant',  -- 'slant' | 'slope' | 'thick' | 'thin' | 'any'
        offsets = {{ filetype = 'NvimTree', text = 'FIle Explorer',  padding = 1 }},
        --show_buffer_close_icons = true,
        show_buffer_close_icons = false,
        --show_close_icon = true, 
        show_close_icon = false, 
        numbers = 'ordinal',  -- 'ordinal' | 'buffer_id' | 'both'
        always_show_bufferline = true, 
        --color_icons = true, 
        color_icons = false, 
      }, 
    })
  end 
}
