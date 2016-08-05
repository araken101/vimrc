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
"""""""""""""""""""""""""""
"Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
" NERDTreeを設定"
" NeoBundle 'scrooloose/nerdtree'
"lightlineの設定"
NeoBundle 'itchyny/lightline.vim'
"テーマの設定
NeoBundle 'altercation/vim-colors-solarized'
"vim-quickrunの設定
NeoBundle 'thinca/vim-quickrun'
"javascriptのインデント設定"
NeoBundle 'pangloss/vim-javascript'
"javascriptのシンタックスハイライト"
NeoBundle 'JavaScript-syntax'
"processingの設定"
NeoBundle 'sophacles/vim-processing'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'Shougo/vimproc',{
	\'build':{
	\	'mac':'make -f make_mac.mak',
	\},
\}
au BufNewFile,BufRead *.pde setf processing
"python"
call neobundle#end()


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

if ! empty(neobundle#get("neocomplete.vim"))
	autocmd FileType python setlocal completeopt-=preview
endif
"python_foldの設定"
NeoBundleLazy "vim-scripts/python_fold",{
	\ "autoload":{"filetypes":["python","python3","djangohtml"] }}
"jedi-vim"
"rename用のマッピングを無効にしたため、代わりにコマンドを定義
command! -nargs=0 JediRename :call jedi#rename()
"pythonのrename用のマッピングがquickrunとかぶるため回避させる
let g:jedi#rename_command = ""
let g:jedi#documentation_command = "k"

" Required:
filetype plugin indent on
"未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

syntax enable
set background=dark
colorscheme solarized
"-------------------------
" End Neobundle Settings.
"-------------------------
