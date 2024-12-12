# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi 
shopt -s autocd
export EDITOR="nvim"

# File hierarchy viewing
alias la="ls -A"
alias li='ls -goht --time-style="+%y-%m-%d %H:%M" "$@"'
alias lia="li -A"
alias ls='ls --color=auto'
alias l='ls' 

# Shortened cd
alias ".."="cd ../"
alias "..."="cd ../../"
alias "...."="cd ../../../"
alias "....."="cd ../../../../"
alias ".p"="cd ~/Documents/programs/"
alias ".s"="cd ~/Documents/school/"

c() {
	cd "$1" || return 1
	ls
}

function mkcd {
	mkdir $1
	cd $1
}

function bak() {
  cp $1 ${1}.bak
}

# NOTE:Highly experimental
m() {
	while true; do
		ls --color=force | cat -n
		echo -n "->"
		read -n 1 -s response
		count=1
		[[ $response = 0 ]] && echo "0" && cd .. || for i in `ls`;
		do [[ $count = $response ]] && cd $i && echo $response && break
			((count++))
		done;
	done;
}

# Search
alias grep='grep --color=auto'
alias gr="grep"
alias eg="grep -E" #egrep
alias fsl="grep -Irl" # Find string, just list matching files
alias fs="grep -Ir" # Find string
alias f="find -name" # Find name
alias fr="find . -regextype sed -regex" # Find regex

# ETC
alias h="head"
alias x="xargs -I {}"

alias day="date +'%y-%m-%d'"
alias dt="date +'%y-%m-%d %R'"
alias image="kitten icat"

function nd() { # .norg file for day
	[[ $1 = "" ]] && nvim "$(day).norg" || nvim "$(day)-$1.norg"
}

function tex() {
	[[ ${1%*.} == "latex" ]] && pdflatex $1 -output-directory=/tmp/
	[[ ${1%*.} == "tex" ]] && pdftex $1 -output-directory=/tmp/ 
	echo /tmp/${1%.*}.pdf
	# zathura /tmp/${1%.*}.pdf &
}

# Random man page

function man-app() {
	man $(find /usr/share/man/man1 -type f | shuf | head -1) # --random-source ~/manPages/random 
}

function man-file() {
	man $(find /usr/share/man/man4 -type f | shuf | head -1)
}

function man-game() {
	man $(find /usr/share/man/man6 -type f | shuf | head -1)
}


function man-format() {
	man $(find /usr/share/man/man5 -type f | shuf | head -1)
}

# vi
alias ":q"='exit'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Safety
alias rm="trash-put" # sudo -S trash-cli
alias mv="mv -i"

# Edit configurations
alias dmanage="~/Documents/dotfiles/meta/dmanage"

# Not in use
alias scr="maim -sok 1 | xclip -selection clipboard -t image/png"
alias weather="curl https://wttr.in/"

# Time
function timer() {
	for a in $(seq $1); do echo -ne "${a}s / ${1}s\r"; sleep 1; done; echo -ne "${1}s / ${1}s\n";
}

function stopwatch() {
	a=0;
	while true; do echo -ne "${a}s\r"; sleep 1; a=$((a+1)); done;
}

# git
gitacp(){
	git add . && git commit -m "$1" && git push
}
alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gst="git status"

# python
function venv() {
source .venv/bin/activate
}

# PS1 
# Don't display IUA characters in the tty
if [ $TERM = "linux" ]; then
	PS1="\$(err=\$?;echo -n '\['; tput setab 5; [[ \$err == 0 ]] || tput setab 1; tput setaf 0;echo -n '\]'; echo -n ' \W ║ \! \['; tput sgr0;tput setaf 5; echo -n '\['; [[ \$err == 0 ]] || tput setaf 1;echo -n '\]'; echo -n '├ '; echo -n '\['; tput sgr0)\]"
else
	PS1="\$(err=\$?;echo -n '\['; tput setab 5; [[ \$err == 0 ]] || tput setab 1; tput setaf 0;echo -n '\]'; echo -n ' \W  \! \['; tput sgr0;tput setaf 5; echo -n '\['; [[ \$err == 0 ]] || tput setaf 1;echo -n '\]'; echo -n ' '; echo -n '\['; tput sgr0)\]"
fi


# Injected by node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
