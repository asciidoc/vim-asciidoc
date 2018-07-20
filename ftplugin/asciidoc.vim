function! AsciidocFold()
	let line = getline(v:lnum)
	if (line =~ '\v^[a-zA-Z]')
		let nextline = getline(v:lnum + 1)
		if (strlen(nextline) != strlen(line))
			return "="
		endif
		if (nextline =~ '\v^-+$')
			return ">1"
		endif
		if (nextline =~ '\v^\~+$')
			return ">2"
		endif
		if (nextline =~ '\v^\^+$')
			return ">3"
		endif
		if (nextline =~ '\v^\++$')
			return ">4"
		endif
	endif
	return "="
endfunction

if has("folding") && exists("g:asciidoc_folding")
  setlocal foldexpr=AsciidocFold()
  setlocal foldmethod=expr
endif
