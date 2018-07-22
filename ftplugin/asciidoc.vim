function! AsciidocFold()
	let line = getline(v:lnum)
	if (line =~ '\v^[a-zA-Z]')
		let nextline = getline(v:lnum + 1)
		if (strlen(nextline) != strlen(line))
			return "="
		elseif (nextline =~ '\v^-+$')
			return ">1"
		elseif (nextline =~ '\v^\~+$')
			return ">2"
		elseif (nextline =~ '\v^\^+$')
			return ">3"
		elseif (nextline =~ '\v^\++$')
			return ">4"
		endif
	elseif (line =~ '\v^\=\=')
		if (line =~ '\v^\=\=\s')
			return ">1"
		elseif (line =~ '\v^\=\=\=\s')
			return ">2"
		elseif (line =~ '\v^\=\=\=\s')
			return ">3"
		elseif (line =~ '\v^\=\=\=\=\s')
			return ">4"
		endif
	endif
	return "="
endfunction

if has("folding") && exists("g:asciidoc_folding")
  setlocal foldexpr=AsciidocFold()
  setlocal foldmethod=expr
endif
