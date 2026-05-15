scriptencoding utf-8

if exists('g:loaded_vi_sql') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

if has('nvim')
  command! -nargs=0 ViSQL lua require('vi-sql').setup()
else
  echohl ErrorMsg
  echomsg "Vi SQL requires Neovim"
  echohl None
endif

let g:loaded_vi_sql = 1

let &cpo = s:save_cpo
unlet s:save_cpo
