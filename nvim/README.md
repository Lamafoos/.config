# README

## Base custom keymappings
	- <space ff> find file
	- <space fr> find recent files
	- <space gb> see git branches
	- <control b> open NvimTree
	- <leader r> refresh NvimTree

## TODO
    - change to vsnip
    - get lint & formatting to work


to find every occurrence in the whole file, with a prompt whether to
substitute or not.

To substitute new for the first old in a line type
cmd
        :s/old/new

    To substitute new for all 'old's on a line type
cmd
        :s/old/new/g

    To substitute phrases between two line #'s type
cmd
        :#,#s/old/new/g

    To substitute all occurrences in the file type
cmd
        :%s/old/new/g

    To ask for confirmation each time add 'c'
cmd
        :%s/old/new/gc