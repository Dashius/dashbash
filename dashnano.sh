include /usr/share/nano/asm.nanorc
include /usr/share/nano/c.nanorc
include /usr/share/nano/groff.nanorc
include /usr/share/nano/html.nanorc
include /usr/share/nano/java.nanorc
include /usr/share/nano/man.nanorc
include /usr/share/nano/mutt.nanorc
include /usr/share/nano/nanorc.nanorc
include /usr/share/nano/patch.nanorc
include /usr/share/nano/perl.nanorc
include /usr/share/nano/pov.nanorc
include /usr/share/nano/python.nanorc
include /usr/share/nano/ruby.nanorc
include /usr/share/nano/sh.nanorc
include /usr/share/nano/tex.nanorc



#### PHP HIGLIGHTING FOLLOWS ####

## PHP Syntax Highlighting
syntax "php" "\.php[2345s~]?$"
color white start="<\?(php|=)?" end="\?>"
# Functions
color brightblue "([a-zA-Z0-9_-]*)\("
# Constructs
color brightblue "(class|extends|goto) ([a-zA-Z0-9_]*)"
color green "[^a-z0-9_-]{1}(var|class|function|echo|case|break|default|exit|switch|if|else|elseif|endif|foreach|endforeach|@|while|public|private|protected|return|true|false|null|TRUE|FALSE|NULL|const|static|extends|as|array|require|include|require_once|include_once|define|do|continue|declare|goto|print|in|namespace|use)[^a-z0-9_-]{1}"
color brightblue "[a-zA-Z0-9]+:"
# Variables
color white "\$[a-zA-Z_0-9$]*|[=!<>]"
color white "\->[a-zA-Z_0-9$]*|[=!<>]"
# Special Characters
color yellow "[.,{}();]"
color yellow "\["
color yellow "\]"
color yellow "[=][^>]"
# Numbers
color magenta "[+-]*([0-9]\.)*[0-9]+([eE][+-]?([0-9]\.)*[0-9])*"
color magenta "0x[0-9a-zA-Z]*"
# Special Variables
color brightblue "(\$this|parent::|self::|\$this-\>)"
# Bitwise Operations
color magenta "(\;|\||\^){1}"
# And/Or/SRO/etc
color green "(\;\;|\|\||::|=>|->)"
# Online Comments
color brightyellow "(#.*|//.*)$"
# STRINGS! # WAS RED FIRST, THEN CYAN
color white "('[^']*')|(\"[^\"]*\")"
# Inline Variables
color white "\{\$[^}]*\}"
# PHP Tags # WAS RED FIRST, THEN CYAN
color white "(<\?(php)?|\?>)"
# General HTML # WAS RED FIRST, THEN CYAN
color white start="\?>" end="<\?(php|=)?"
# trailing whitespace
color ,green "[^[:space:]]{1}[[:space:]]+$"
# multi-line comments
color brightyellow start="/\*" end="\*/"

#### END PHP HIGHLIGHTING ####



##############################################################################
#
# Syntax highlighting for CSS files
#  
# Author:  Simon Rupf, simon.rupf(a)int-ag.ch
# License: GPL 2  or later
#
# Version: 2005-02-14
#
##############################################################################

syntax "css" "\.css$"
color brightred     "."
color brightyellow  start="\{" end="\}"
color brightwhite           start=":" end="[;^\{]"
color brightblue    ":active|:focus|:hover|:link|:visited|:link|:after|:before|$"
color brightblue    start="\/\*" end="\\*/"
color green         ";|:|\{|\}"


### all *js files  ( e.g. Firefox user.js, prefs.js )

## Old version

#syntax "jsfiles" "(\.|/|)js$"
#color green "//.*$" start="\/\*" end="\*\/"
#color blue "'(\\.|[^'])*'"
#color red ""(\\.|[^\"])*""
#color brightgreen "\<(true)\>"
#color brightred "\<(false)\>" "http\:\/\/.*$"
#color brightmagenta "[0-9](\\.|[^\"])*)"

## New updated taken from http://wiki.linuxhelp.net/index.php/Nano_Syntax_Highlighting

syntax "JavaScript" "\.(js)$"
## Default
color white "^.+$"
## Decimal, cotal and hexadecimal numbers
color yellow "\<[-+]?([1-9][0-9]*|0[0-7]*|0x[0-9a-fA-F]+)([uU][lL]?|[lL][uU]?)?\>"
## Floating point number with at least one digit before decimal point
color yellow "\<[-+]?([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([EePp][+-]?[0-9]+)?[fFlL]?"
color yellow "\<[-+]?([0-9]+[EePp][+-]?[0-9]+)[fFlL]?"
## Keywords
color green "\<(break|case|catch|continue|default|delete|do|else|finally)\>"
color green "\<(for|function|if|in|instanceof|new|null|return|switch)\>"
color green "\<(switch|this|throw|try|typeof|undefined|var|void|while|with)\>"
## Type specifiers
color red "\<(Array|Boolean|Date|Enumerator|Error|Function|Math)\>"
color red "\<(Number|Object|RegExp|String)\>"
color red "\<(true|false)\>"
## String
color brightyellow "L?\"(\\"|[^"])*\""
color brightyellow "L?'(\'|[^'])*'"
## Escapes
color red "\\[0-7][0-7]?[0-7]?|\\x[0-9a-fA-F]+|\\[bfnrt'"\?\\]"
## Comments
color magenta start="/\*" end="\*/"
color magenta "//.*$"
