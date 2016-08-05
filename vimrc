set mouse=a
set ttymouse=xterm2
set number
set clipboard+=unnamed
set backspace=indent,eol,start
set laststatus=2

"""""""""""""""""""""""""""
"自動的に括弧を補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" NeoBundleの開発が終わったのですべてDein.vimに移行します
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
"Dein Script-----------------------------
if &compatible
	set nocompatible	"Be iMproved
endif
"Required:
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim
"Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')
"lightlineの設定"
call dein#add('itchyny/lightline.vim')
"テーマの設定
call dein#add('altercation/vim-colors-solarized')
"vim-quickrunの設定
call dein#add('thinca/vim-quickrun')
"javascriptのインデント設定"
call dein#add('pangloss/vim-javascript')
"javascriptのシンタックスハイライト
call dein#add('JavaScript-syntax')
"processingの設定
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('Shougo/neocomplete.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('tomtom/tcomment_vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('hokaccha/vim-html5validator')
call dein#add('tyru/open-browser.vim')
call dein#add('tell-k/vim-browsereload-mac')
call dein#add('mattn/emmet-vim')
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('kana/vim-smartinput')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-operator-replace')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('bps/vim-textobj-python')
au BufNewFile,BufRead *.pde setf processing
"python"


let g:syntastic_mode_map = {
	\ 'mode':'active',
	\ 'active_filetypes':['php','coffeescript','sh','vim'],
	\ 'passive_filetypes':['html','haskell','python']
	\}

"quickrunの設定"
let g:quickrun_config = {
\	"_":{
\		"outputter/buffer/split":":botright 8sp",
\		"outputter/buffer/close_on_empty":1,
\		"runner":"vimproc",
\		"runner/vimproc/updatetime":40,
\	},
\}
"neocompleteの設定"
if has('lua') && ((v:version == 703 && has('patch885'))||(v:version >= 704))
	let g:completion = "Shougo/neocomplete.vim"
	NeoBundleLazy g:completion,{
		\ "autoload":{"insert":1}}
endif

"jedi-vim"
"rename用のマッピングを無効にしたため、代わりにコマンドを定義
command! -nargs=0 JediRename :call jedi#rename()
"pythonのrename用のマッピングがquickrunとかぶるため回避させる
let g:jedi#rename_command = ""
let g:jedi#documentation_command = "k"

" Required:
" you can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })  
" Required:
call dein#end()
filetype plugin indent on
"未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"毎回聞かれると邪魔な場合もあるので、この設定は任意です。
syntax enable
set background=dark
colorscheme solarized
"-------------------------
" End Neobundle Settings.
"-------------------------
