if ( exists('g:loaded_react_vim') && g:loaded_react_vim )
  finish
endif

let g:loaded_react_vim = 17
com! -bar -range=% ReactHtmlToJSX call react#HTML2JSX()
