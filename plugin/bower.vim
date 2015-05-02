function! s:Bower(bang, args)
  let cmd = 'bower ' . a:args
  execute ':!' . cmd
endfunction

command! -bar -bang -nargs=* Bower call s:Bower(<bang>0,<q-args>)

function! s:BReset()
  " TODO remove when https://github.com/bower/bower/pull/1617 is merged
  :let path = !glob(".bowerrc") ? 'bower_components' : 'bower_components'
  :execute "! rm -rvf " . path . "; bower --verbose cache clean; bower --verbose install;"
endfunction
command! -nargs=0 Breset call s:BReset()