" Vundle.vim
"
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'surround.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails.git'
Plugin 'osyo-manga/vim-monster'
" スクロールをスムースにする
Plugin 'yonchu/accelerated-smooth-scroll'


" コード補完
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'marcus/rsense'
"Plugin 'supermomonga/neocomplete-rsense.vim'

" 静的解析
Plugin 'scrooloose/syntastic'

" ドキュメント参照
Plugin 'thinca/vim-ref'
Plugin 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
Plugin 'szw/vim-tags'

" 自動で閉じる
Plugin 'tpope/vim-endwise'

" color-schema"
Plugin 'vim-scripts/twilight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------

syntax enable
set background=dark
colorscheme hybrid

set number
"新しい行のインデントを現在の行と同じにする
set autoindent
"タブ文字、行末等の不可視文字の表示
set list
set listchars=tab:^\ ,trail:~,extends:.
"タブ設定
set tabstop=2
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"エラー時のビープ音無効
set belloff=all
" 現在開いているファイル名を表示
set title
" ウィンドウを跨いでのコピー&ペースト
set clipboard=unnamed,autoselect

" jjで挿入モードから抜ける設定
inoremap <silent> jj <ESC>

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"Vimでruby等をF5で実行できるようにする
" File type detection is On.
filetype on

augroup vimrc
    " Remove all autocommands in this group
    autocmd!

    " <F5> key execution
    autocmd FileType java        nmap <buffer> <F5> :!javac -encoding UTF-8 % && java %<<CR>
    autocmd FileType javascript  nmap <buffer> <F5> :!node %<CR>
    autocmd FileType php         nmap <buffer> <F5> :!php %<CR>
    autocmd FileType python      nmap <buffer> <F5> :!python %<CR>
    autocmd FileType ruby        nmap <buffer> <F5> :!ruby %<CR>
    autocmd FileType go          nmap <buffer> <F5> :!go run %<CR>
    autocmd FileType groovy      nmap <buffer> <F5> :!groovy %<CR>
    autocmd FileType vim         nmap <buffer> <F5> :source %<CR>
augroup END

set belloff=all
