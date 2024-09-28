
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
set -o vi 
alias ls='ls --color=auto'
alias grep='grep --color=auto'

. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

PS1="\$(err=\$?;tput setab 5; tput setaf 0; [[ \$err == 0 ]] || tput setab 1; echo -n \" \W/  \! \"; git -C \$(pwd) rev-parse 2>/dev/null && echo -n \"\$(__git_ps1 )  \"; echo -n \" \"; tput sgr0; tput setaf 5; [[ \$err == 0 ]] || tput setaf 1) `tput sgr0;`" 

PS1="\$(err=\$?;tput setab 5; tput setaf 0; [[ \$err == 0 ]] || tput setab 1; echo -n \" \W/  \! \"; git -C \$(pwd) rev-parse 2>/dev/null && echo -n \" \$(basename \$(git rev-parse --show-toplevel)) (\$(git rev-parse --abbrev-ref HEAD))  \"; echo -n \" \"; tput sgr0; tput setaf 5; [[ \$err == 0 ]] || tput setaf 1) `tput sgr0;`" 
c() {
	cd "$1" || return 1
  l
}

l() {
	ls -goh --time-style="+%y-%m-%d %H:%M" "$@"; 
}
