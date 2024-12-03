# If not running interactively, don't do anything
[[ $- != *i* ]] && return
set -o vi 

#set wildmode=longest,list,full
#set wildmenu

alias ls='ls --color=auto'
alias l='ls' 
alias grep='grep --color=auto'
alias g="grep"
alias scr="maim -sok 1 | xclip -selection clipboard -t image/png"
alias weather="curl https://wttr.in/"
alias day="date +'%y-%m-%d'"

function nd() {
	[[ $1 = "" ]] && nvim "$(day).norg" || nvim "$(day)-$1.norg"
}

alias image="kitten icat"

alias "~"="cd $HOME"
alias ".."="cd ../"
alias "..."="cd ../../"
alias "...."="cd ../../../"
alias "....."="cd ../../../../"
alias ".p"="cd ~/Documents/programs/"
alias ".s"="cd ~/Documents/school/"
alias "~"="cd ~"
alias ":q"='exit'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
export EDITOR="nvim"

# Don't display IUA characters in the tty
if [ $TERM = "linux" ]; then
	PS1="\$(err=\$?;echo -n '\['; tput setab 5; [[ \$err == 0 ]] || tput setab 1; tput setaf 0;echo -n '\]'; echo -n ' \W ║ \! \['; tput sgr0;tput setaf 5; echo -n '\['; [[ \$err == 0 ]] || tput setaf 1;echo -n '\]'; echo -n '├ '; echo -n '\['; tput sgr0)\]"
else
	PS1="\$(err=\$?;echo -n '\['; tput setab 5; [[ \$err == 0 ]] || tput setab 1; tput setaf 0;echo -n '\]'; echo -n ' \W  \! \['; tput sgr0;tput setaf 5; echo -n '\['; [[ \$err == 0 ]] || tput setaf 1;echo -n '\]'; echo -n ' '; echo -n '\['; tput sgr0)\]"
fi

c() {
	cd "$1" || return 1
  ls
}

alias g="grep"

function timer() {
	for a in $(seq $1); do echo -ne "${a}s / ${1}s\r"; sleep 1; done; echo -ne "${1}s / ${1}s\n";
}

function stopwatch() {
	a=0;
	while true; do echo -ne "${a}s\r"; sleep 1; a=$((a+1)); done;
}

la() {
	ls -goht --time-style="+%y-%m-%d %H:%M" "$@"; 
}

gitacp(){
	git add . && git commit -m "$1" && git push
}

function bak() {
  cp $1 ${1}.bak
}

function mkcd {
	mkdir $1
	cd $1
}

# Injected by node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#source "/home/twocarrot10/deps/skia/third_party/externals/emsdk/emsdk_env.sh"
