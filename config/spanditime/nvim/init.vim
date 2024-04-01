" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)

if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif
endif

" set nocompatible

call plug#begin()

Plug 'kmonad/kmonad-vim'

" to be perfectly honest idk what most of these are, but its related to magic lsp
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'                " dependecy for telescope and lsp 

" Telescope is a fuzzy finder for buffers, keybinds and much more
Plug 'nvim-telescope/telescope.nvim'        " search files and text more easily
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " native fzf support for telescope
 
Plug 'nvim-lualine/lualine.nvim'

Plug 'vifm/vifm.vim'
" Plug 'puremourning/vimspector'              " gui debugger for dbg providers

" language features - highlight/refactor/completition
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " lang tree - syntax hl, tag explorer and much more
Plug 'nvim-treesitter/playground'                               " playground for ts adds a couple of utility functions
Plug 'nvim-treesitter/nvim-treesitter-refactor'                 " refactoring features using treesitter
Plug 'nvim-treesitter/nvim-treesitter-context'                " show curr context on top of window if it isnt visible
Plug 'numToStr/Comment.nvim'                                    " motion based comment plugin
" cmp+snippy (completition and snippets) section
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/nvim-cmp'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

" Extra highlight features
Plug 'ap/vim-css-color'                     " backlight hex colors:
Plug 'chrisbra/colorizer'                   " since last plugin dont have support for all types i had to also use this


" some git features directly from vim improved from shell com
Plug 'machakann/vim-colorscheme-tatami'


" visual sugar
Plug 'airblade/vim-gitgutter'               " git added/changed/deleted symb on gutter
Plug 'p00f/nvim-ts-rainbow'                 " different colors for nested brackets
Plug 'lukas-reineke/indent-blankline.nvim'  " indents visualising
Plug 'sunjon/shade.nvim'                    " dimm incative windows

Plug 'kevinhwang91/promise-async' " required by ufo
Plug 'kevinhwang91/nvim-ufo' " folds


call plug#end()

let mapleader = " "

" ctrl +j/k delete an empty line below/above , alt + j/k insert an empty line
" below/above
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

inoremap kj <esc>

" Find files using Telescope command-line sugar.
" open las used Telescope window
nnoremap <leader>e <cmd>Vifm<cr>
nnoremap <leader>F <cmd>Telescope resume<cr>
nnoremap <leader>ff <cmd>Telescope current_buffer_fuzzy_find<cr>
" find in curr buffer
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
" tag explorer for current buff
nnoremap <leader>fe <cmd>Telescope find_files<cr>   " find files by namer
nnoremap <leader>fg <cmd>Telescope live_grep<cr>   " find files by file text
nnoremap <leader>fb <cmd>Telescope buffers<cr>     " find in buffers
nnoremap <leader>fH <cmd>Telescope help_tags<cr>   " find in help tags
nnoremap <leader>fhh <cmd>Telescope highlights<cr> " find highlight group
nnoremap <leader>fhk <cmd>Telescope keymaps<cr>    " find keymaps

nnoremap tn <cmd>bn<cr>
nnoremap tp <cmd>bp<cr>
nnoremap tq <cmd>bwipeout<cr>

set hlsearch
set tabstop=4
set shiftwidth=4
set noexpandtab
" set autoindent
set number relativenumber
set cc=80,120
set cursorline
" set formatoptions-=t


set list lcs=space:⋅,eol:↴,tab:¦⋅

colorscheme tatami

" indent settings
lua require "user.lsp"
lua require "user.plugins"
