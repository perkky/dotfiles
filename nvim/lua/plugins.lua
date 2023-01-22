return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use {'neoclide/coc.nvim', branch = 'release'}

    -- Themes --
    use 'folke/tokyonight.nvim'
    use 'sonph/onehalf'
    use 'danilo-augusto/vim-afterglow'
    use 'tlhr/anderson.vim'
    use 'sainnhe/everforest'
    use 'tomasr/molokai'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'tpope/vim-commentary'

    use 'windwp/nvim-autopairs'

    use 'lervag/wiki.vim'

    use {
      'phaazon/hop.nvim',
      branch = 'v1', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        -- require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        require'hop'.setup {}
      end
    }

    use { 'alexghergh/nvim-tmux-navigation' }

    use { 'tpope/vim-fugitive' }
end)
