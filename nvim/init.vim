:set number
:set tabstop=4
:set autoindent
:set expandtab
:set smarttab
:set softtabstop=4
:set encoding=UTF-8
:set clipboard=unnamedplus
:set hlsearch
:set splitright
:set splitbelow
:set showmatch
:set incsearch

:set hidden
:set nobackup
:set nowritebackup
:set cmdheight=2
:set updatetime=300
:set shortmess+=c
:set signcolumn=yes
:set termguicolors

syntax on
filetype plugin indent on

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let g:load_doxygen_syntax=1

let mapleader = ","

" autocmd BufEnter * silent! lcd %:p:h

" system clipboard
"nmap <c-c> "+y
"vmap <c-c> "+y
"nmap <c-v> "+p
"inoremap <c-v> <c-r>+
"cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
"inoremap <c-r> <c-v>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" newline in normal mode
:nnoremap <NL> i<CR><ESC>

let &t_ti.="\e[5 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[5 q"
let &t_te.="\e[5 q"

nnoremap <C-t> :NERDTreeToggle<CR>

"toggle lines
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

"tabbing remaps
nnoremap H gT
nnoremap L gt

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/space-vim-dark'
Plug 'ryanoasis/vim-devicons'
Plug 'whatyouhide/vim-gotham'
Plug 'sainnhe/everforest'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vimsence/vimsence'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'neoclide/coc.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'vim-syntastic/syntastic'
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tinyheero/vim-myhelp'
Plug 'dkasak/gruvbox'
Plug 'dag/vim2hs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'beauwilliams/focus.nvim'

call plug#end()

"---------------- plugin configs ------------------"
lua require("focus").setup()
lua require'colorizer'.setup()
lua require'colorizer'.attach_to_buffer(0)

" haskell

let g:dashboard_default_executive='fzf'

let g:rainbow_active = 1 

"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let g:everforest_background = 'hard'
let g:everforest_transparent_background = 1
let g:everforest_sign_column_background = 'none'
let g:everforest_enable_italic = 1

let g:tokyonight_style = 'night'
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1
let g:tokyonight_transparent = 1

"if has('termguicolors')
"set termguicolors
"endif

let g:everforest_background='hard'

let g:gruvbox_contrast_dark="hard"
let g:gruvbox_sign_column='bg0'
autocmd vimenter * ++nested colorscheme gruvbox

let g:airline_theme='gruvbox'
set t_RV=

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi EndOfBuffer ctermbg=NONE guibg=NONE

nnoremap <F2> :ToggleTerm size=100 direction=float shade_terminals=true shading_factor=2 float_opts={ border=curved }<CR>

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" NEOVIDE configurations
let g:neovide_transparency=0.9
set guifont=JetBrains\ Mono:h9

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let $FZF_DEFAULT_COMMAND = 'ag --depth 10 --hidden --ignore .git -g ""'

let g:dashboard_custom_header = [
      \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
      \]
