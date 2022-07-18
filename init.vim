" option-----------------------------
set number  "行番号表示
set cursorline "現在の行を強調表示
set cursorcolumn "現在の行の背景色を変更
set laststatus=2 "ステータス行を常に表示
set cmdheight=2 "メッセージ表示欄を２行確保
set tabstop=2 "タブで半角スペース２つ分
set shiftwidth=2 "自動インデントで半角スペース２つ分
set expandtab
set showmatch "括弧入力時の対応する括弧を表示
set list listchars=tab:\▸\-
" set splitright "画面分割時に右側に画面を開く
set clipboard=unnamed "yankをクリップボードにコピーする
set autochdir "開いたファイルをカレントディレクトリにする
" search_setting
set hlsearch " 検索語をハイライト
set incsearch " インクリメンタルサーチを行う
set wrapscan " 最後尾まで検索を終えたら次の検索で先頭に移る

set mouse=a "マウスを利用可能にする
set helplang=ja,en "ヘルプを日本語で表示する"
set relativenumber "カーソルからの相対的な行番号を表示する
set autoread "ファイルが他で変更されている場合に自動的に読み直す
set noswapfile "swapファイルを保存しない"

"commandline_setting
set history=10000

" coc.nvim--------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" dein Scripts-----------------------------
if &compatible
  set nocompatible             " Be iMproved
endif

" dein base directory.
let s:dein_dir = expand('~/.cache/dein')

" dein repository directory.
let s:dein_repo = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" vim settings directory. {{{

" vim setting directory. 設定ファイルでsourceコマンドを実行する？
let g:base_dir = fnamemodify(expand('<sfile>'), ':h') .. '/'

" vimrcs dirctory.
let s:vimrcs_dir = g:base_dir ..'rc/'

" plugins toml-file directory.
let s:toml_dir = g:base_dir .. 'toml/'
let s:toml_files = systemlist('ls ' .. s:toml_dir .. '*.toml')
" }}}

" dein installation check {{{

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo
  endif
  execute 'set runtimepath^=' . s:dein_repo 
endif

"}}}

" dein options {{{

" GitHub apt token file.

" }}}


" Begin settings {{{

if dein#min#load_state(s:dein_dir)

  " dein inline_vimrcs setting.{{{

  let g:dein#inline_vimrcs = ['mapping.vim']

  " Use neovide
  if exists("g:neovide")
    call add(g:dein#inline_vimrcs, 'neovide.vim')
  endif

  call map(g:dein#inline_vimrcs, { _, val -> s:vimrcs_dir .. val })


  " }}}

  call dein#begin(s:dein_dir)
  
  for toml_file in s:toml_files
    if toml_file == s:toml_dir .. 'dein.toml'
      call dein#load_toml(toml_file, {'lazy': 0})
    else
      call dein#load_toml(toml_file, {'lazy': 1 })
    endif
  endfor

  " Test local plugins
  " call dein#local('~/Project', {''lazy': 1, 'on_source': 'skkeleton'},
  " ['lightline-skk'])

  " end setting
  call dein#end()
  call dein#save_state()
endif

" }}}

" Plugin installation check {{{
if dein#check_install()
  call dein#install()
endif

"}}}

call map(dein#check_clean(), "delete(v:val, 'rf')")

" ファイル形式別プラグインの有効
filetype plugin indent on
" シンタックスハイライトの有効
syntax enable

"End dein Scripts-------------------------

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

