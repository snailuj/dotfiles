let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/coding/treshna/mrimpossible
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +11 web/static/ui/pages/edit_resource.re
badd +121 web/booking_resource_settings.py
badd +10 web/static/ui/src/lyci/LyciFuture.re
badd +22 web/static/ui/src/bindings/InputColor.re
badd +1655 web/settings.py
badd +35 web/templates/manage_resource_group.html
badd +1 web/functions.py
badd +940 common/utility.py
badd +59 web/static/ui/src/flask/booking/settings/BookingSettings_ResourceGroup.re
badd +181 web/static/ui/src/flask/booking/settings/BookingResource.re
badd +15 web/templates/manage_resource_group_edit.html
badd +412 web/static/ui/pages/booking_settings_resource_group_edit.re
badd +1 web/static/ui/src/flask/booking/settings/Settings_ResourceGroup.re
badd +56 web/static/js/manage_resource_group_edit.js
badd +1 web/static/ui/src/lyci/LyciString.rei
badd +5 web/static/ui/src/FilterMonad.rei
badd +23 web/static/ui/src/FilterMonad.re
badd +454 web/static/ui/src/api/Api.re
badd +17 web/static/ui/src/lyci/Lyci.re
badd +3 web/static/ui/src/flask/dto/Config.re
badd +1 web/static/ui/pages
argglobal
silent! argdel *
$argadd web/static/ui/pages/edit_resource.re
edit web/static/ui/src/flask/booking/settings/BookingSettings_ResourceGroup.re
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
exe 'vert 1resize ' . ((&columns * 80 + 159) / 319)
exe 'vert 2resize ' . ((&columns * 102 + 159) / 319)
exe 'vert 3resize ' . ((&columns * 135 + 159) / 319)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=20
setlocal fml=1
setlocal fdn=20
setlocal fen
4
normal! zo
64
normal! zo
83
normal! zo
106
normal! zo
let s:l = 59 - ((38 * winheight(0) + 39) / 78)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
59
normal! 05|
lcd ~/coding/treshna/mrimpossible
wincmd w
argglobal
if bufexists('~/coding/treshna/mrimpossible/web/static/ui/pages/edit_resource.re') | buffer ~/coding/treshna/mrimpossible/web/static/ui/pages/edit_resource.re | else | edit ~/coding/treshna/mrimpossible/web/static/ui/pages/edit_resource.re | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=13
setlocal fml=1
setlocal fdn=20
setlocal fen
23
normal! zo
25
normal! zo
300
normal! zo
324
normal! zo
340
normal! zo
342
normal! zo
351
normal! zo
382
normal! zo
383
normal! zo
385
normal! zo
395
normal! zo
397
normal! zo
397
normal! zo
420
normal! zo
422
normal! zo
442
normal! zo
443
normal! zo
444
normal! zo
534
normal! zo
541
normal! zo
542
normal! zo
549
normal! zo
550
normal! zo
696
normal! zo
697
normal! zo
700
normal! zo
717
normal! zo
718
normal! zo
721
normal! zo
740
normal! zo
741
normal! zo
742
normal! zo
762
normal! zo
let s:l = 702 - ((16 * winheight(0) + 39) / 78)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
702
let s:c = 43 - ((36 * winwidth(0) + 51) / 102)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 43 . '|'
else
  normal! 043|
endif
lcd ~/coding/treshna/mrimpossible
wincmd w
argglobal
if bufexists('~/coding/treshna/mrimpossible/web/static/ui/pages/booking_settings_resource_group_edit.re') | buffer ~/coding/treshna/mrimpossible/web/static/ui/pages/booking_settings_resource_group_edit.re | else | edit ~/coding/treshna/mrimpossible/web/static/ui/pages/booking_settings_resource_group_edit.re | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=20
setlocal fml=1
setlocal fdn=20
setlocal fen
23
normal! zo
25
normal! zo
48
normal! zo
63
normal! zo
122
normal! zo
176
normal! zo
198
normal! zo
199
normal! zo
233
normal! zo
234
normal! zo
236
normal! zo
237
normal! zo
242
normal! zo
242
normal! zo
260
normal! zo
261
normal! zo
263
normal! zo
264
normal! zo
265
normal! zo
266
normal! zo
272
normal! zo
273
normal! zo
275
normal! zo
278
normal! zo
278
normal! zo
279
normal! zo
279
normal! zo
279
normal! zo
279
normal! zo
279
normal! zo
279
normal! zo
279
normal! zo
285
normal! zo
286
normal! zo
296
normal! zo
297
normal! zo
298
normal! zo
298
normal! zo
298
normal! zo
298
normal! zo
298
normal! zo
298
normal! zo
298
normal! zo
298
normal! zo
309
normal! zo
315
normal! zo
316
normal! zo
321
normal! zo
322
normal! zo
332
normal! zo
331
normal! zo
331
normal! zo
340
normal! zo
345
normal! zo
346
normal! zo
351
normal! zo
352
normal! zo
362
normal! zo
362
normal! zo
363
normal! zo
366
normal! zo
366
normal! zo
366
normal! zo
366
normal! zo
366
normal! zo
366
normal! zo
366
normal! zo
366
normal! zo
372
normal! zo
378
normal! zo
379
normal! zo
384
normal! zo
385
normal! zo
402
normal! zo
403
normal! zo
404
normal! zo
408
normal! zo
409
normal! zo
418
normal! zo
426
normal! zo
426
normal! zo
426
normal! zo
428
normal! zo
428
normal! zo
429
normal! zo
let s:l = 417 - ((47 * winheight(0) + 39) / 78)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
417
normal! 019|
lcd ~/coding/treshna/mrimpossible
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 80 + 159) / 319)
exe 'vert 2resize ' . ((&columns * 102 + 159) / 319)
exe 'vert 3resize ' . ((&columns * 135 + 159) / 319)
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
