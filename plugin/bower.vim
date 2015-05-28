if (exists('g:loaded_bower') && g:loaded_bower) || v:version < 700 || &cp
  finish
endif
let g:loaded_bower = 1

" Syntax highlighting for bower-rails descriptor
au BufRead,BufNewFile Bowerfile set filetype=ruby

function! s:Bower(bang, args)
  let cmd = 'bower ' . a:args
  execute ':!' . cmd
endfunction

command! -bar -bang -nargs=* Bower call s:Bower(<bang>0,<q-args>)

function! s:BReset()
  " TODO reroute to `bower reset` once https://github.com/bower/bower/pull/1617 gets rebased
  let path = !glob(".bowerrc") ? 'bower_components' : 'bower_components'
  execute "! rm -rvf " . path . " && bower --verbose cache clean && bower --verbose install"
endfunction
command! -nargs=0 Breset call s:BReset()