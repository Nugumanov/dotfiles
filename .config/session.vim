let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 Projects/globble/media/agent-replicant/sabre/.gitlab-ci.yml
badd +9 Projects/globble/media/agent-replicant/sabre/docker-compose.yml
badd +14 Projects/globble/media/agent-replicant/sabre/sabre-tg/.gitlab-ci.yml
badd +1 Projects/globble/devops/infrastructure/.gitlab-ci.yml
badd +1 Projects/globble/devops/infrastructure/ansible/group_vars/all.yml
badd +1 Projects/globble/media/agent-replicant/sabre/sabre-gen/script.py
badd +9 Projects/globble/media/agent-replicant/sabre/sabre-gen/modules/transcript_service_factory.py
badd +2490 dotfiles/.config/kitty/kitty.conf
badd +1 fugitive:///Users/advena/Projects/globble/media/agent-replicant/sabre/.git//
badd +89 dotfiles/.config/nix-darwin/flake.nix
badd +36 Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Globble/AI\ browser.md
badd +1 dotfiles/.config/starship/starship.toml
badd +3 Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Globble/Skyvern\ vs\ browser-use\ comparison.md
badd +43 dotfiles/.config/nvim/lua/custom/plugins/modules/avante.lua
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit dotfiles/.config/nvim/lua/custom/plugins/modules/avante.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 156 + 98) / 197)
tcd ~/dotfiles/.config
argglobal
enew
file ~/Projects/globble/media/agent-replicant/sabre/neo-tree\ filesystem\ \[7]
balt ~/dotfiles/.config/starship/starship.toml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
balt ~/dotfiles/.config/kitty/kitty.conf
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 43 - ((40 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 43
normal! 023|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 156 + 98) / 197)
tabnext
edit ~/Projects/globble/media/agent-replicant/sabre/docker-compose.yml
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 39 + 30) / 61)
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe '2resize ' . ((&lines * 39 + 30) / 61)
exe 'vert 2resize ' . ((&columns * 95 + 98) / 197)
exe '3resize ' . ((&lines * 1 + 30) / 61)
exe 'vert 3resize ' . ((&columns * 60 + 98) / 197)
exe '4resize ' . ((&lines * 1 + 30) / 61)
exe 'vert 4resize ' . ((&columns * 60 + 98) / 197)
exe '5resize ' . ((&lines * 35 + 30) / 61)
exe 'vert 5resize ' . ((&columns * 60 + 98) / 197)
exe '6resize ' . ((&lines * 18 + 30) / 61)
tcd ~/Projects/globble/media/agent-replicant/sabre
argglobal
enew
file ~/Projects/globble/media/agent-replicant/sabre/neo-tree\ filesystem\ \[1]
balt ~/Projects/globble/media/agent-replicant/sabre/sabre-gen/script.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
balt ~/Projects/globble/media/agent-replicant/sabre/sabre-gen/modules/transcript_service_factory.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
enew
balt ~/Projects/globble/media/agent-replicant/sabre/docker-compose.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
if bufexists(fnamemodify("fugitive:///Users/advena/Projects/globble/media/agent-replicant/sabre/.git//", ":p")) | buffer fugitive:///Users/advena/Projects/globble/media/agent-replicant/sabre/.git// | else | edit fugitive:///Users/advena/Projects/globble/media/agent-replicant/sabre/.git// | endif
if &buftype ==# 'terminal'
  silent file fugitive:///Users/advena/Projects/globble/media/agent-replicant/sabre/.git//
endif
balt ~/Projects/globble/media/agent-replicant/sabre/sabre-gen/modules/transcript_service_factory.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr=<<<<<<<<,>>>>>>>>
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
exe '1resize ' . ((&lines * 39 + 30) / 61)
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe '2resize ' . ((&lines * 39 + 30) / 61)
exe 'vert 2resize ' . ((&columns * 95 + 98) / 197)
exe '3resize ' . ((&lines * 1 + 30) / 61)
exe 'vert 3resize ' . ((&columns * 60 + 98) / 197)
exe '4resize ' . ((&lines * 1 + 30) / 61)
exe 'vert 4resize ' . ((&columns * 60 + 98) / 197)
exe '5resize ' . ((&lines * 35 + 30) / 61)
exe 'vert 5resize ' . ((&columns * 60 + 98) / 197)
exe '6resize ' . ((&lines * 18 + 30) / 61)
tabnext
edit ~/Projects/globble/devops/infrastructure/ansible/group_vars/all.yml
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 156 + 98) / 197)
tcd ~/Projects/globble/devops/infrastructure
argglobal
enew
file ~/Projects/globble/media/agent-replicant/sabre/neo-tree\ filesystem\ \[2]
balt ~/Projects/globble/devops/infrastructure/.gitlab-ci.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
balt ~/Projects/globble/devops/infrastructure/.gitlab-ci.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 76 - ((22 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 76
normal! 043|
wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 156 + 98) / 197)
tabnext
edit ~/dotfiles/.config/nix-darwin/flake.nix
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 29 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 107 + 98) / 197)
exe '3resize ' . ((&lines * 46 + 30) / 61)
exe 'vert 3resize ' . ((&columns * 59 + 98) / 197)
exe '4resize ' . ((&lines * 2 + 30) / 61)
exe 'vert 4resize ' . ((&columns * 59 + 98) / 197)
exe '5resize ' . ((&lines * 8 + 30) / 61)
exe 'vert 5resize ' . ((&columns * 59 + 98) / 197)
tcd ~/dotfiles/.config/nix-darwin
argglobal
enew
file ~/dotfiles/.config/nix-darwin/neo-tree\ filesystem\ \[3]
balt ~/dotfiles/.config/nix-darwin/flake.nix
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
balt fugitive:///Users/advena/Projects/globble/media/agent-replicant/sabre/.git//
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 89 - ((42 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 89
normal! 0
wincmd w
argglobal
enew
balt ~/dotfiles/.config/nix-darwin/flake.nix
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
exe 'vert 1resize ' . ((&columns * 29 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 107 + 98) / 197)
exe '3resize ' . ((&lines * 46 + 30) / 61)
exe 'vert 3resize ' . ((&columns * 59 + 98) / 197)
exe '4resize ' . ((&lines * 2 + 30) / 61)
exe 'vert 4resize ' . ((&columns * 59 + 98) / 197)
exe '5resize ' . ((&lines * 8 + 30) / 61)
exe 'vert 5resize ' . ((&columns * 59 + 98) / 197)
tabnext
edit ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Globble/Skyvern\ vs\ browser-use\ comparison.md
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 156 + 98) / 197)
tcd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents
argglobal
enew
file ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/neo-tree\ filesystem\ \[6]
balt ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Globble/AI\ browser.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
balt ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Globble/AI\ browser.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 3 - ((2 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 02|
wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 98) / 197)
exe 'vert 2resize ' . ((&columns * 156 + 98) / 197)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
