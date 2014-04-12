func! react#Dash_to_camel_case(in)
  let l:parts = filter(split(a:in,"-"),'!empty(v:val)')
  let l:capitalize = 'toupper(strpart(v:val,0,1)).tolower(strpart(v:val,1))'
  if strpart(a:in,0,1) == '-'
    return join(map(l:parts, l:capitalize), '')
  else
    return l:parts[0] . join(map(l:parts[1:],l:capitalize),'')
endfunc

func! react#Convert_style(css)
  let out = []
  for style in split(a:css, '\s*;\s*')
    let [prop, val] = split(style,'\s*:\s*')
    let out = add(out, react#Dash_to_camel_case(prop).":'".val."'")
  endfor
  return join(out,", ")
endfunc

func! react#HTML2JSX()
  :'<,'>s/style="\(.\+\)"/\="style={{".react#Convert_style(submatch(1))."}}"/ge
  :'<,'>s/class="\(.\+\)"/className="\1"/ge
endfunc


