"改行コード自動判別
set fileformats=unix,dos,mac

"バックアップをとらない
set nobackup

"スワップファイルを作らない
set noswapfile

"インデントの設定
set autoindent
set smartindent

"タブの設定
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

"文字コードの設定
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
"set encoding=utf-8

" 検索結果ハイライト表示
set hlsearch

" 全角記号を表示するための設定
set ambiwidth=double

" ハイライト表示を消す
nmap <Esc><Esc> :nohlsearch<CR>

" OSのクリップボードを利用する
set clipboard=unnamed,autoselect

" ヤンクした文字を、OSのクリップボードで利用する
" set clipboard+=unnamed

"plugin管理フォルダのパス追加
set rtp+=~/.vim/

" カーソル行をハイライト
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END


"vundleの設定 START
filetype off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"以下に Bundle '管理したいプラグイン名' を書く

" 下部に表示されるかっこいい線
NeoBundle 'itchyny/lightline.vim'

" ファイラー
NeoBundle 'Shougo/unite.vim'

" コード上にあるメソッド、変数の宣言を一覧で表示
NeoBundle 'taglist.vim'

" tagsを利用したコード表示
NeoBundle 'Source-Explorer-srcexpl.vim'

" ツリー型のエクスプローラー
NeoBundle 'The-NERD-tree'

" NERD_tree, taglist, srcexpl の統合
NeoBundle 'trinity.vim'

" Railsのコードをよむサポート
NeoBundle 'tpope/vim-rails'

" color
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'jonathanfilip/vim-lucius'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"vundleの設定 END

" Vim-PowerLine用に設定
set laststatus=2

" Unite 用キーマップ
nnoremap    [unite]   <Nop>
nmap f [unite]

" 分割しないでuniteのbufferを表示する
nnoremap [unite]u  :<C-u>Unite -no-split<Space>

" 全部乗せ
nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -no-split -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -buffer-name=files file<CR>
" バッファ一覧
nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
" 常用セット
nnoremap <silent> [unite]u  :<C-u>Unite -no-split buffer file_mru<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m  :<C-u>Unite -no-split file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d  :<C-u>UniteWithBufferDir -no-split file<CR>

" コマンド追加
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" 256色 有効
set t_Co=256

" カラースキーム
colorscheme lucius

" 構文ごとに色分けする
syntax on

" set tags
if has("autochdir")
" 編集しているファイルのディレクトリに自動で移動
    set autochdir
    set tags=tags;
else
    set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

"set notagbsearch

" [Srcexpl]の設定
let g:SrcExpl_UpdateTags    = 1 " tagsをsrcexpl起動時に自動で作成（更新）
let g:SrcExpl_RefreshTime   = 0 " 自動表示するまでの時間(0:off)
let g:SrcExpl_WinHeight     = 7 " プレビューウインドウの高さ
let g:SrcExpl_GoBackMapKey  = "<C-Space>" " 戻る機能のMAP
let g:SrcExpl_RefreshMapKey = "<Space>" " 手動表示のMAP

" SourceExplorerの機能ON/OFF
nmap <F8> :TrinityToggleSourceExplorer<CR>

" [taglist]の機能ON/OFF
nmap <F7> :Tlist<CR>

" [NERD_tree]の機能ON/OFF
nmap <F6> :NERDTreeToggle<CR>


"オートコマンド
"タブの設定
au BufNewFile,BufRead *.rb set tabstop=2
au BufNewFile,BufRead *.rb set shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2
au BufNewFile,BufRead *.yml set shiftwidth=2
au BufNewFile,BufRead *.rake set tabstop=2
au BufNewFile,BufRead *.rake set shiftwidth=2
au BufNewFile,BufRead *.erb set tabstop=2
au BufNewFile,BufRead *.erb set shiftwidth=2
au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.js set shiftwidth=2
au BufNewFile,BufRead *.c set noexpandtab
au BufNewFile,BufRead *.cpp set noexpandtab
au BufNewFile,BufRead *.h set noexpandtab
au BufNewFile,BufRead *.tmp set noexpandtab

" highlight trailing whiltespaces
" from https://github.com/skuroki/dotfiles/blob/master/files/.vimrc#L42
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" lightline
let g:Powerline_symbols = 'fancy'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
