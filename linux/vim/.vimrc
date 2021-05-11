" Moi nalashtuvannia VIM

set nocompatible " be IMproved
filetype off
let mapleader=',' " vykorystovuvaty prefiks 'koma' dlia bahatofaktornoho vidobrazhennia kliuchovykh sliv

" set guifont=monofur\ for\ Powerline:h14 " font
set termguicolors " pidtrymka koloru

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim " vkliuchennia ta initsializatsiia Vundle

call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " dozvolyty Vundle keruvaty Vundle
Plugin 'wakatime/vim-wakatime' " Wakatime
" Navihatsiia proektiv
Plugin 'preservim/nerdtree' " navihatsiia po failam/tekam
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'majutsushi/tagbar' " navihatsiia po klasam/funktsiiam/zminnym
Plugin 'Shougo/unite.vim' " navihatsiia mizh buferom i failom
Plugin 'valloric/youcomplete' " autozavershennia
" Bufer
Plugin 'jlanzarotta/bufexplorer'
" Plugin 'rosenfeld/conque-term' " vykorystovuiemo dlia vyklyku debahera
" Mova
" Python
Plugin 'klen/python-mode' " refaktorinh, dokumentasiia, debaher Python i t.p.
Plugin 'vim-python/python-syntax'
Plugin 'davidhalter/jedi-vim' " avtodopovnebbia dlia Pyton
Plugin 'mitsuhiko/vim-jinja' " pidtrymka syntaksysu shabloniv Jinja
Plugin 'mitsuhiko/vim-python-combined' " combined Python 2/3 for VIM
Plugin 'hunek/vim-python-pep8-indent' " PEP8 indent
Plugin 'jmcantrell/vim-virtualenv' " pidtrymka virtualenv VIM
" HTML
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'ap/vim-css-color'
Plugin 'elzr/vim-json' " JSON
" Snippets
" Plugin 'garbas/vim-snipmate' " menedzher frahmentiv
" Plugin 'MarcWeber/vim-addon-mw-utils' " zalezhnosti #1
" Plugin 'tomtom/tlib_vim' " zalezhnosti #2
" Plugin 'honza/vim-snippets' " snipety
" Brackets
Plugin 'luochen1990/rainbow' " rainbow brackets
" Plugin 'tpope/vim-surround' " avtozakryttia tehiv HTML/XML i t.p.
" Tahlist
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/closetag.vim'
" Zavdannia
Plugin 'fisadev/FixedTaskList.vim' " poshuk u faili FIXME, TODO i t.p.
" Istoriia
Plugin 'mbbill/undotree' " vizualizator istorii dlia VIM
" Komenty
Plugin 'preservim/nerdcommenter'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim' " Lightline statusbar
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go, {'do': ':GoUpdateBinares'}'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'valloric/youcomplete'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ryanoasis/vim-devicons'
Plugin 'frazrepo/vim-rainbow'
Plugin 'severin-lemaignan/vim-minimap'
" Plugin 'vifm/vifm.vim'
" Plugin 'vimwiki/vimwiki'
" Plugin 'jreybert/vimagit'
call vundle#end()

if !exists("g:syntax_on")
    syntax enable
endif

let g:airline_powerline_fonts=1 " by default, airline will use unicode symbols if your encoding matches utf-8, if you want the powerline symbols set this variable
let g:airline_theme='base16_vim' " themes are automatically selected based on the matching colorscheme, this can be overridden by defining a value

fyletype on " rozpiznannia typiv failiv i plahiniv
filetype plugin indent on

syntax on " pidsvitka syntaksysu
set termguicolors " pidtrymka koloru
" set t_Co=256 " 256 koloriv
set background=light " background
colorscheme 0x7A69_dark " aktyvna kolorova skhema
" => Kolorovi temy VIM
" 0x7A69_dark, 1989, 256-grayvim, 256-jungle, 256_noir
" abbott, abstract, alduin, amber, ambient, amcolors, amdark, amlight, ampresent, ancient, anderson, angr, antares, apprentice, arcadia, atlantis, archman, argonaut, atlantic-dark, atlas, atom, austere, ayu, azuki, alchemie
" base16-atelierdune, badwolf, base, bclean, beauty256, benlight, Benokai, bernhard, birds-of-paradise, blackboard, black_is_the_color, blacklight, blame, blandon, blaquemagick, blayu, bleh, blue-mood, bluewery-light, bluewery, boa, borland, breezy, breve, brighton, briofita, broduo, bubblegum-256-dark, bubblegum-256-light, burnttoast256, bushfire8, bushfire, BusyBee, bw, base16-duotone-dark
" cryslominsa, C64, cabin, cake16, cake, calmar256-light, candid, CandyPaper, carbonized-dark, carbonized-light,cascadia, ceudah, cjameleon, Chasing_Logic, ChocolateLiquor, cleanroom, cmptrclr, cobalt2, cobalt, colibri, colorful256, colorsbox-faff, colorsbox-greenish, colorsbox-material, colorsbox-stblue, colorsbox-stbright, colorsbox-steighties, colorsbox-stnight, contrastneed, cosme, cosmic_latte, crayon, codeburn
" desert-night, dante, darcula, darkglass, dark_purple, darkslategray, darkspectrum, darktheme, desertEx, despacio, Dev_Delight, diokai, disciple, distilled, donbass, dragon-energy, duna, duoduo, duo-mini, dvo
" earendel, ecostation, edge, editplus, ego, eink, elrodeo, erez, eva01-LCL, eva01, evening
" fairy-garden, fairyfloss, falcon, fantasy, feral, film_noir, FiraCode, flatcolor, flatlandia, flattened_dark, flattened_light, flattown, flattr, flatui, focusedpanic, focuspoint
" ice-age
" lost-shrine
" mustang
" vanilla-cake
" zenburn

set path+=** " => rekursivno shukaie potochnii kataloh

set autoread " avtomatychno perechytuie zmineni faily
set confirm " vykorystovuie dialoh zamist spovishchennia pro pomylky
set lz " linyve peremaliuvannia ekranu pry vykonanni skryptiv
set ruler " liniika
" set noruler " vidkliuchyty liniiku
set backspace=indent,eol,start " backspace vidpratsovuie vidstupy, kintsivky riadkiv
set sessionoptions=curdir,buffers,tabpages " optsii sesii zminyty potochnu deryktoriiu, vykorystovuvaty bufer i taby
set noswapfile " ne vykorystovuvaty svop fail
set visualbell " blymaty kursory pry pomylkakh zamist zvukovoho syhnalu
set noerrorbells visualbell t_vb= " vymknuty zvukove spovishchennia do kintsia bufera, nemozhlyvist diiaty
autocmd GUIEnter * set visualbell t_vb=

set et " avtozamina za zamovchenniam
set showmatch " pidsvichuie pershu parnu duzhku pislia vvedennia druhoi
set matchtime=1
set nu " nomer riadku
set relativenumber
set ch=2 " harantuvaty komandnyi riadok iz zadanoiu kilkistiu riadkiv
set fdm=indent " folding on
set iskeyword=@,48-57,-,192-255 " nav based on ru characters, take into account the next/previous word commands etc.
set showbreak=?\
set scrolloff=3 " zberihaite bilshe kontekstu pid chas prokruchuvannia kintsia
set nojoinspaces " pry ziednanni riadkiv ne vstabliaite dva znaky pislia punktuatsii
set cursorline " vydilyty riadok tekstu de znakhodytsia kursor

set textwidth=100 " pry peretyni kordonu v 100 symvoliv u Ruby/Python/JS/C/C++ tekst vydiliaietsia na temnomu tli
set colorcolumn=100

set enc=utf-8
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

set ffs=unix,dos,mac " Koduvannia i format failu
set fencs=utf-8,cp1251,koi8-r,cp866

" set wildmenu " bilshe informatsii
" set wildmode=longest:full,full

set scrolloff=3 " kilkist riadkiv zverkhu s znyzu ekrana pry skrolinhu
set wrap " vidobrazhaty dovhi riadky yak zahornuty
" set nowrap " ne perenesennia dovhykh riadkiv
set linebreak " zavershyty pry perervi slova
set whichwrap=b,<,>,[,],l,h " peremishchennia kursoru na nastupnyi riadok
" set virtualedit=all " kursor vykhodyt za mezhi riadka
set ai " avtovidstupy dlia novoho riadku

set foldenable " skladnii vidstup
set foldlevel=100
set foldmethod=indent
set autoindent " avtomatychnii vidstup
set smartindent " rozumni vidstupy
set expandtab " peretvorennia tabiv na probily
set shiftwidth=4 " typovyi rozmir tabu
set softtabstop=4 " 4 probily u tabi
set ts=4 " tabstop
set shiftround " kruhlii vidstup do  kratnoho 'shiftwidth'
set smarttab

set list
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬

set title " imia bufera u zaholovku terminalu
set hidden " => ne zavantazhuite bufer obminu pry perekhodu na inshyi, shchob redahuvaty kilka failiv odnochasno, ne zberihaiuchy kozhen fail pry perekliuchenni mizh nymy
" set clipboard=unnamed " vykorystovuvaty systemnyi bufer
set history=500 " zberihaty bilshe istorii komand
set undolevels=2048 " zberihaty istorii zmin chyslom N
set pastetoggle= " zberihaty vidstup pry vstavtsi frahmentu

set noswapfile " vidkliuchennia stvorennia .swp failiv
set splitbelow splitright " kontroliuite polozhennia novoho vikna

set completeopt-=preview
set gcr+=a:blinkon0
set ttyfast
tab sball
set switchbuf=useopen

set wrapscan " search-next wraps back to start of file
set hlsearch " pidsvichennia rezultativ poshuku
set incsearch " poshuk po miri naboru
set ignorecase " poshuk bez urakhuvannia rehystru symvoliv
set smartcase " poshuk z urakhuvanniam rehystru

vnoremap <silent>* <ESC> :call VisualSearch()<CR>/<C-R>/<CR> " poshuk po vydilenniu teksta
vmoremap <silent>* <ESC> :call VisualSearch()<CR>?<C-R>/<CR>

set showcmd " pokazuie ne zaversheni komandy u status bari
autocmd CursorMoved * silent! exe prontf("match Search/\\<%s\\>/",wxpand('<cword>')) " pidsvichuie usi slova yaki spivpadaiut zi slovamy pid kursorom

set mps+=<:> " spivpadinnia duzhok v HTML tah
let python_highlight_all = 1 " pidsvichennia usoho python
let c_syntax_for_h="" " faily *.h pryvlasniuie C, ni CPP
set cin " vidstupy v  ctyli C

autocmd BufNewFile,BufReadPost *.md set filetype=markdown " Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh'] " vydilyty syntaksys bloku kodu u vashykh dokumentakh z rozmitkoiu
let g:markdown_minlines = 100 " znachennia vydilennia syntaksysu

set mouse=a " pidtrymka myshi
set mousehide " skhovaty mysh u rezhymi vvodu tekstu
set mousemodel=popup
set mouse=nicr " prokruchennia myshi

set backupdir=~/.vim/backups// """ backup in one central location ending in double slashes indicates that temporary files contain a path, thus allowing backups of two files edited with the same name
set directory=~/.vim/backups//
set backup

set ls=2 " Riadok stanu
let g:airlines_powerline_fonts = 1
let g_airline_section_b = '%{strftime("%c")}'
let g:airline#extensions#tabline#enables = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:aitline_theme='light'

hi StatusLine gui=reverse cterm=reverse " zminyty shryft riadku stanu na ne zhyrnyi
" highlight SpellBad ctermfg=Black ctermbg=Red " chervonyi na chervonomu

let g:gitgutter_max_signs = 500 " Git

set noerrorbells visualbell t_vb= " mute the sound notification until the end of the buffer, inability to act
autocmd GUIEnter * set visualbell t_vb=

autocmd BufEnter * :syntax sync fromstart " perekonaitesia, shcho pidsvichiuvannia pratsiioe do kintsia dovhoho failu

" =====> Python <=====
" => Python-mode
" => vidkliuchaiemo avtokomplit po kodu zamist my vykorystovuiemo jedi-vim
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" => documentatsiia
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" => perevirka kodu
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflake,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" => perevirka kodu pislia zberihannia
let g:pymode_lint_write = 1

" => pitrymka virtualnoho seredovyshcha
let g:pymode_virtualenv = 1

" => vstanovlennia breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" => pidsvichennia syntaksysu
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" => pidsvichiuvannia syntaksysu
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" => vidkliuchennia autofold po kodu
let g:pymode_folding = 0

" => mozhlyvist zapusku kodu
let g:pymode_tun = 0

let python_highlight_all = 1
" let s:PathToExecutevle = ''

" ===> Jedi-vim <===
" => vymknuty vybir pershoi funktsii/metodu pry avtozavershenni
let g:jedi#popup_select_first = 0

" => rozkomentuite u vypadku yaksho ne treba shchob jedi-vim pokazuvav dokumentatsiiu
" autocmd FileType python set completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
                \ formatoptions+=croq softtabstop=4 smartindent
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 smartindent
                \ cinwords=if,elif,else,for,while,try,except,finaly,def,class,with

" =====> HTML <=====
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
" autocmd BufNewFile,BufRead *.mako setlocal ft=mako
" autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
" autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
" let html_no_rendering=1
" let g:closetag_default_xml=1
" let g:sparkupNextMappong='c-l>'
" autocmd FileType html,htmldjango,htmljinja,eruby.mako let b:closetag_htmlstyle=1
" autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source
" ~/.vim/scripts/closetag.vim

" => rozshyrennia failiv de tsei plahin uvimkneno *.xml, *.html, *.xhtml, ....
let g:closetag_filenames = '*.html,*.xhtml,*phtml'

" => spysok tehiv, shcho ne zakryvaiutsia samostiino zakryvaiuchys u vkazanykh failakh *.xml, *.xhtml
let g:closetag_xhtml_filenames = '*,xhtml,*.jsx'

" => typy failiv, de tsei plahin uvimkneno
let g:closetag_filetypes = 'html,xhtml,phtml'

" => tse zrobyt spysok tehiv, shcho ne zakryvaiutsia samostiino zakryvaiuchys u vkazanykh failakh
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" => tse zrobyt spysok tehiv, shcho ne zakryvaiutsia z urakhuvanniam rehistru
let g:closetag_emptyTags_caseSensitive = 1

" => vymykaie avtomatyxhne zakryttia, yakshcho v 'diisnomu' rehioni
let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ }

" => yarlyk dlia zakryttia tehiv, za zamovchuvanniam
let g:closetag_shortcut = '>'

" => dodaty '>' u potochnomu polozheni, ne zakryvaiuchy potochnyi tehm za zamovchuvanniam
let g:closetag_close_shortcut = '<leader>>'

" ===> CSS <===
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" ===> JavaScript <===
let javascript_enable_domhtmcss=1
autocmd FileType javascript set omnifunc=javascriptcoplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" ===> JSON <===
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd Filetype json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END

" =====> Tagbar <=====
" => avtofokus na Tagbar pry vidkrytti
let g:tagbar_autofocus=0
map <F4> :TagbarToggle<CR>

" =====> Tasklist <=====
" => vidobrazhennia spysku taskiv
map <F2> :TaskList><CR>

" =====> UndoTree <=====
" => postiine skasuvavannia, navit yakshcho vy zakryite ta povtorno vidkryite VIM
set undofile

" =====> Snippets <=====
" => vkazuiemo kaloh z nalashtuvanniamy
" let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" =====> Vifm <=====
" map <Leader>vv :Vifm<CR>
" map <Leader>vs :VsplitVifm<CR>
" map <Leader>sp :SplitVifm<CR>
" map <Leader>dv :DiffVifm<CR>
" map <Leader>tv :TabVifm<CR>

" =====> VimWiki <=====
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

" => Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

" NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] |wincmd p | exe 'cd'.argv()[0] | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
" =====> NERDTree <=====
" autocmd vimenter * NERDTree " avtostart NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumber=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=38
" hariachi klavishi
map <C-n> :NERDTreeToggle<CR>

" Undotree
" set undofile " permanent cancellation even if you close and reopen Vim. Super great when combined with the Undotree plugin

" Omnicomplete
" set omnifunc=syntaxcomplete#Complete
" autocmd FileType python runtime! autoload/pythoncomplete.vim
" autocmd FileType python setlocal omnifunc=pysmell#Complete

" Tagbar
" map <F4> :TagbarToggle<cr>
" let g:tagbar_autofocus=0 " Tagbar autofocus on openning

" Airline
set ls=2
let g:airline#extensions#tabline#enabled=1 " top status line
let g:airline#extensions#tabline#formater='unique_tail'

" =====> Lightline <=====
set ls=2
let g:lightline = {
                    \ 'colorscheme': '16color',
                    \ }
" Temy dlia Lightline:
" 16color
" ayu_dark, ayu_light, ayu_mirage
" deus, darcula, default
" jellybeans
" landscape
" materia, material, molokai
" noed
" one, OldHope
" PaperColor, PaperColor_dark, PaperColor_light, powerline(default), powerlineish
" selenized_back, selenized_dark, selenized_light, selenized_white, seoul256, simpleblack, solarized, srcery_dark
" Tomorrow, Tomorrow_Night, Tomorrow_Night_Blue, Tomorrow_Night_Bright, Tomorrow_Night_Eighties
" wombat

" Mapping
" avtomatychne zakryttia duzhok
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" => zakryty potochnyi buffer CTRL+Q
map <C-q> :bd<CR>
" => zapusk interprytatora na <F5>
nnoremap <F5> :ConqueTermSplit ipython<CR>
" => debuh mod na <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" => perevirka kodu vidpovidno z PEP8 cherez <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
" => avtokomplit cherez <CTRL+Space>
inoremap <C-space> <C-x><C-o>
" => perekliuchennia mizh syntaksysamy
nnoremap <leader>Th :set ft=hymljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>
" :imap ii <ESC>

highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=none
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none
" highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
" highlight Folded           ctermfg=103     ctermbg=234     cterm=none
" highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none

if has("gui_running")
    let $LANG = 'en_gb' " mova VIM
    set langmenu=en_gb " mova meniu VIM
    set guioptions-=T " prykhovaty panel v GUI
    set guioptions-=r " scrollbar
    set guioptions-=m " meniu
    set lines=45 " linii
    set columns=140 " stovpchyky
    set guifont=monofur\ for\ Powerline:h14 " Shryft
    aunmenu Help
    aunmenu Windows
endif