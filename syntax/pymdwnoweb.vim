" Vim syntax file
" Language:    Python noweb mdw Files
" Last Change: 2010 May 14
" Version:     0.1
" Remarks:     - Inspired by rnoweb.vim
"

" Version Clears: {{{1
" For version 5.x: Clear all syntax items
" For version 6.x and 7.x: Quit when a syntax file was already loaded
if version < 600 
  syntax clear
elseif exists("b:current_syntax")
  finish
endif 

syn case match

" Extension of Tex clusters {{{1
runtime syntax/pandoc.vim
unlet b:current_syntax

" syn cluster mkdNonListItem add=@pymdwnoweb

" Highlighting of python code using an existing r.vim syntax file if available {{{1
syn include @pymdwnowebPy syntax/python.vim
syn region pymdwnowebChunk matchgroup=pymdwnowebDelimiter start="^<<.*>>=" matchgroup=pymdwnowebDelimiter end="^@" contains=@pymdwnowebPy,pymdwnowebChunkReference,pymdwnowebChunk fold keepend
syn match pymdwnowebChunkReference "^<<.*>>$" contained
syn region pymdwnowebSexpr matchgroup=Delimiter start="\\Sexpr{" matchgroup=Delimiter end="}" contains=@pymdwnowebPy

" Sweave options command {{{1
syn region pymdwnowebSweaveopts matchgroup=Delimiter start="\\SweaveOpts{" matchgroup=Delimiter end="}"

" pymdwnoweb Cluster {{{1
syn cluster pymdwnoweb contains=pymdwnowebChunk,pymdwnowebChunkReference,pymdwnowebDelimiter,pymdwnowebSexpr,pymdwnowebSweaveopts

" Highlighting {{{1
hi def link pymdwnowebDelimiter	Delimiter
hi def link pymdwnowebSweaveOpts Statement
hi def link pymdwnowebChunkReference Delimiter

let   b:current_syntax = "pymdwnoweb"
" vim: foldmethod=marker:
