vim.cmd [[
try
    colorscheme tokyonight-moon
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme habamax
    set background=dark
endtry
]]
