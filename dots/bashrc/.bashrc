# If not running interactively, don't do anything
[[ $- != *i* ]] && return
set -o vi 

set wildmode=longest,list,full
set wildmenu

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias df='df -h'
alias df='du -h'
alias df='free -h'
alias scr="maim -sok 1 | xclip -selection clipboard -t image/png"
alias weather="curl https://wttr.in/"

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias ":q"='exit'
alias cs='clear; ls'

export GIT_PS1_SHOWDIRTYSTATE=1

alias ".."="cd ../"
alias "..."="cd ../../"
alias "...."="cd ../../../"
alias "....."="cd ../../../../"

export EDITOR="nvim"
if [ $TERM = "linux" ]; then
 #PS1="`tput setab 5; tput setaf 0;` \! `tput setab 0; tput setaf 5``tput sgr0;` "
	PS1="\$(err=\$?;tput setab 5; [[ \$err == 0 ]] || tput setab 1; tput setaf 0; echo -n '\! ';tput setab 0;tput setaf 5; [[ \$err == 0 ]] || tput setaf 1; echo -n ' ';tput sgr0)"
else
	PS1="\$(err=\$?;tput setab 5; [[ \$err == 0 ]] || tput setab 1; tput setaf 0; echo -n '\!';tput setab 0;tput setaf 5; [[ \$err == 0 ]] || tput setaf 1; echo -n ' ';tput sgr0)"
fi

#PS1="\$(err=\$?;tput setab 5; tput setaf 0; [[ \$err == 0 ]] || tput setab 1; echo -n \"  \! | \"; [[ \"\${PWD##/home/}\" != \"\${PWD}\" ]] && echo -n \"   \"; [[ \"\${PWD##/home/\$USER/Documents/school}\" != \"\${PWD}\" ]] && echo -n \"   \"; [[ \"\${PWD##/home/\$USER/Documents/programs}\" != \"\${PWD}\" ]] && echo -n \"   \"; git -C \$(pwd) rev-parse 2>/dev/null && echo -n \" \$(basename \$(git rev-parse --show-toplevel)) (\$(git rev-parse --abbrev-ref HEAD))  \";echo -n \" \W\"; tput sgr0; tput setaf 5; [[ \$err == 0 ]] || tput setaf 1) \$(tput sgr0;)" 
# echo -n \" \";       
#       

c() {
	cd "$1" || return 1
  l
}

function timer() {
	for a in $(seq $1); do echo -ne "${a}s / ${1}s\r"; sleep 1; done; echo -ne "${1}s / ${1}s\n";
}

l() {
	ls -goht --time-style="+%y-%m-%d %H:%M" "$@"; 
}

function backup() {
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
