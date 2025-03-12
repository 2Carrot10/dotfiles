# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi 
shopt -s autocd
export EDITOR="nvim"

### File hierarchy viewing ###
alias ls="ls --color=auto"  # default to normal behavior when using ls instead of l
alias eza="eza --sort time --icons always --color always --no-filesize" # or use 'ls --color=auto'
alias l="eza" #'ls --color=auto'
alias li="l -lh --no-user --time-style='+%y-%m-%d %H:%M'" #for /bin/ls: 'ls -goht --time-style="+%y-%m-%d %H:%M" "$@"'
alias la="l -A"
alias lia="li -A"
alias lai="li -A"
alias ltree="l --tree -L $1" # Make sure to add level (i.e. tree 2)

### Shortened cd ###
alias ".."="cd ../"
alias "..."="cd ../../"
alias "...."="cd ../../../"
alias "....."="cd ../../../../"
alias ".p"="cd ~/Documents/programs/"
alias ".s"="cd ~/Documents/school/"
alias dif="git diff --name-only"

alias logall="ls | xargs -I {} bash -c 'echo -e "\\\\e[32m*{}\\\\e[00m"; cat {}'"

c() {
	cd "$1" || return 1
	ls
}

function peekmd() {
  pandoc $1 --from=markdown --to=pdf -o - | zathura - 2>/dev/null
}

function peekweb() {
  curl -s $1 | pandoc - --from=html --to=markdown -o - | zathura - 2>/dev/null
}

# Grep for help
grelp() {
$1 --help | grep --color=always ${@:2} 
}

# NOTE:Highly experimental. Currently nonfunctional
# m() {
# 	while true; do
# 		ls --color=always | cat -n
# 		echo -n "-> "
# 		read -n 2 response
# 		count=1
# 		[[ $response = 00 ]] && echo && cd .. || for i in `ls`;
# 		do [[ $count = $response ]] && cd $i && echo && break
# 			((count++))
# 		done;
# 	done;
# }

# File modification
function mkcd() {
	mkdir $1
	cd $1
}

function bak() {
  cp $1 ${1}.bak
}

### Search ###
alias grep="grep --color=auto"
alias gr="grep"
alias eg="grep -E" # egrep
alias fsl="grep -Irl" # Find string, just list matching files
alias fs="grep -Ir" # Find string
alias f="find -name" # Find name
alias fr="find . -regextype sed -regex" # Find regex

### ETC ###
alias lessr="less -R" # less (raw)
alias h="head"
alias t="tail"
alias x="xargs -I {}"

alias day="date +'%y-%m-%d'"
alias dt="date +'%y-%m-%d %R'"
alias image="kitten icat"

color() {
$1 --color=always ${@:2}
}

# .norg file for day
# Automatically handles adding a name to the file
# If not given a name and today's file already exists, use that one.
function nd() {
  if [[ $1 = "" ]]; then
    ls | grep "$(day).*\.norg" && nvim $(day)*.norg || nvim "$(day).norg" 
  else
    nvim "$(day)-$1.norg"
  fi
}

# BUG: Nonfunctional
# function tex() {
# 	[[ ${1%*.} == "latex" ]] && lualatex $1 -output-directory=/tmp/
# 	[[ ${1%*.} == "tex" ]] && pdftex $1 -output-directory=/tmp/ 
# 	# echo /tmp/${1%.*}.pdf
# 	zathura /tmp/${1%.*}.pdf &
# }

# Random man page
# BUG: Nonfunctional
# function man-app() {
# a=sed "1q;d" "$HOME/manPages/count" | awk -F " " '{print $2}'
# echo $a
# man $(find /usr/share/man/man1 -type f | shuf --random-source $HOME/manPages/random | sed "${a}q;d") #  
# }

function man-file() {
	man $(find /usr/share/man/man4 -type f | shuf | head -1)
}


function man-app() {
	man $(find /usr/share/man/man1 -type f | shuf | head -1)
}

function man-game() {
	man $(find /usr/share/man/man6 -type f | shuf | head -1)
}


function man-format() {
	man $(find /usr/share/man/man5 -type f | shuf | head -1)
}

### Fast Fetch ###
alias ff="clear; fastfetch"

### vi ###
alias ":q"="exit"
alias np="nvim -p" # allows opening multiple files with `nvim a.txt b.txt c.txt`
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

### Safety ###
alias rm="trash-put" # you could also use rm -i # sudo -S trash-cli
alias mv="mv -i"

# Edit configurations
alias dotctl="~/Documents/dotfiles/meta/dotctl"
alias dc=dotctl

# Not in use
alias scr="maim -sok 1 | xclip -selection clipboard -t image/png"
alias weather="curl https://wttr.in/"

### Git ###
# acp = add, commit, push
gitacp(){
	git add . && git commit -m "$1" && git push
}

alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gst="git status"

# Python
function venv() {
source .venv/bin/activate
}

PS1="\$(err=\$?; echo -n '\['; tput sgr0; tput setaf 5; [[ \$err == 0 ]] || tput setaf 1; echo -n '\e[1m\]-> '; echo -ne '\['; tput sgr0)\]"

# Don't display IUA characters in the tty
if [ $TERM = "linux" ]; then
  alias eza="eza --sort time --icons never --no-filesize"
fi


# Injected by node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
