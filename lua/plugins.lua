--
-- automatically install packer
--
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path,
        })
        print('Installing packer close and reopen Neovim...')
        vim.cmd([[packadd packer.nvim]])
        print('Done.')
        return true
    end
    return false
end

local PACKER_BOOTSTRAP = ensure_packer()

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
    git = {
        cmd = 'git',
        subcommands = {
            update = 'pull --ff-only --progress --rebase=false --force',
            install = 'clone --depth %i --no-single-branch --progress',
            fetch = 'fetch --depth 9999999 --progress --force',
            checkout = 'checkout %s --',
            update_branch = 'merge --ff-only @{u}',
            current_branch = 'branch --show-current',
            diff = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
            diff_fmt = '%%h %%s (%%cr)',
            get_rev = 'rev-parse --short HEAD',
            get_msg = 'log --color_never --pretty=format:FMT --no-show-signature HEAD -n 1',
            submodules = 'submodule update --init --recursive --progress',
        },
        -- git clone depth
        depth = 1,
        -- timeout in seconds for git clones
        clone_timeout = 60,
        -- lua format string used for "aaa/bbb" style plugins
        default_url_format = 'https://github.com/%s',
    },
    -- set the python command to use for running hererocks
    luarocks = {
        python_cmd = 'python'
    },
    -- the default print log level. one of: 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
    log = { level = 'warn' },
    profile = {
        enable = false,
        threshold = 1,      -- integer in milliseconds, plugins which load faster than this
    },
    -- Remove disable or unused plugins without prompting the user
    autoremove = false,
})


--
-- install favorite plugins here
--
return require('packer').startup(function(use)
    -- Packer can manage itself, and common utilities
    use({ 'wbthomason/packer.nvim' })
    use({ 'nvim-lua/plenary.nvim' })

    -- colorscheme
    use({
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
    })

    -- status line
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
--[[        config = function()
            require('nvim-tree/nvim-web-devicons').setup()
            require('nvim-lualine/lualine.nvim').setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                }
            })
        end, ]]
    })
    -- bufferline
    use({ 'akinsho/bufferline.nvim' })

    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
