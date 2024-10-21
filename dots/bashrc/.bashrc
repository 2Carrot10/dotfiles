
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
set -o vi 

# set show-mode-in-prompt on
# set vi-ins-mode-string \1\e[6 q\2
# set vi-cmd-mode-string \1\e[2 q\2

set wildmode=longest,list,full
set wildmenu

# optionally:
# switch to block cursor before executing a command


alias ls='ls --color=auto'
alias grep='grep --color=auto'

. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

PS1="`tput setab 5; tput setaf 0;` \!  \W `tput setab 0;tput setaf 5``tput sgr0;` "

#PS1="\$(err=\$?;tput setab 5; tput setaf 0; [[ \$err == 0 ]] || tput setab 1; echo -n \"  \! | \"; [[ \"\${PWD##/home/}\" != \"\${PWD}\" ]] && echo -n \"   \"; [[ \"\${PWD##/home/\$USER/Documents/school}\" != \"\${PWD}\" ]] && echo -n \"   \"; [[ \"\${PWD##/home/\$USER/Documents/programs}\" != \"\${PWD}\" ]] && echo -n \"   \"; git -C \$(pwd) rev-parse 2>/dev/null && echo -n \" \$(basename \$(git rev-parse --show-toplevel)) (\$(git rev-parse --abbrev-ref HEAD))  \";echo -n \" \W\"; tput sgr0; tput setaf 5; [[ \$err == 0 ]] || tput setaf 1) \$(tput sgr0;)" 
# echo -n \" \";       
#       

c() {
	cd "$1" || return 1
  l
}

l() {
	ls -goht --time-style="+%y-%m-%d %H:%M" "$@"; 
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
