let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/coding/treshna/mrimpossible
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +443 web/static/ui/pages/edit_resource.re
badd +33 web/static/ui/src/api/Fetcher.re
badd +157 web/static/ui/src/api/fetchers/BookingResource.re
badd +15 web/static/ui/src/bindings/Context.re
badd +67 web/static/ui/pages/_app.jsx
badd +8 web/static/ui/src/bindings/Context.bs.js
badd +150 web/static/ui/src/api/GymMaster.re
badd +3 web/static/ui/src/api/Api.re
badd +1 web/static/ui/src/api
badd +1 web/static/ui/src/lyci/Lyci.re
badd +6 web/static/ui/src/lyci/LyciResult.re
badd +6 web/static/ui/src/lyci/LyciOption.re
badd +6 web/static/ui/src/api/Api.rei
badd +2 web/static/ui/src/api/Headers.re
argglobal
silent! argdel *
$argadd web/static/ui/pages/edit_resource.re
edit web/static/ui/src/api/Api.re
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 159) / 319)
exe 'vert 2resize ' . ((&columns * 106 + 159) / 319)
exe 'vert 3resize ' . ((&columns * 105 + 159) / 319)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=8
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 46 - ((45 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 03|
wincmd w
argglobal
if bufexists('web/static/ui/src/api/Api.re') | buffer web/static/ui/src/api/Api.re | else | edit web/static/ui/src/api/Api.re | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
31
normal! zo
63
normal! zo
78
normal! zo
80
normal! zo
67
normal! zo
92
normal! zo
149
normal! zo
159
normal! zo
174
normal! zo
177
normal! zo
178
normal! zo
190
normal! zo
192
normal! zo
192
normal! zo
195
normal! zo
195
normal! zo
195
normal! zo
196
normal! zo
229
normal! zo
230
normal! zo
231
normal! zo
248
normal! zo
249
normal! zo
256
normal! zo
257
normal! zo
281
normal! zo
284
normal! zo
287
normal! zo
288
normal! zo
300
normal! zo
300
normal! zo
300
normal! zo
302
normal! zo
303
normal! zo
312
normal! zo
313
normal! zo
let s:l = 282 - ((31 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
282
normal! 0
lcd ~/coding/treshna/mrimpossible
wincmd w
argglobal
if bufexists('~/coding/treshna/mrimpossible/web/static/ui/src/api/GymMaster.re') | buffer ~/coding/treshna/mrimpossible/web/static/ui/src/api/GymMaster.re | else | edit ~/coding/treshna/mrimpossible/web/static/ui/src/api/GymMaster.re | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=20
setlocal fen
42
normal! zo
119
normal! zo
let s:l = 122 - ((71 * winheight(0) + 39) / 79)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
122
normal! 055|
lcd ~/coding/treshna/mrimpossible
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 159) / 319)
exe 'vert 2resize ' . ((&columns * 106 + 159) / 319)
exe 'vert 3resize ' . ((&columns * 105 + 159) / 319)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=a
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
