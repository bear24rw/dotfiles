# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

source /etc/profile.d/bash-completion.sh

export PATH="/usr/lib/distcc/bin:/media/other/xilinx/ISE_DS/ISE/bin/lin/:/home/user/scripts/:${PATH}"
export PATH="/home/user/eagle-5.10.0/bin/:${PATH}"
export LD_LIBRARY_PATH="/opt/cuda/sdk/C/lib:/usr/local/lib64:${LD_LIBRARY_PATH}"
export LDPATH="/opt/cuda/sdk/C/lib:/usr/local/lib64:${LDPATH}"
export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig:${PKG_CONFIG_PATH}"

if [ $TERM = "xterm" ]; then
    export TERM="xterm-256color"
fi

alias ssh_server='ssh pwner@durknation.gotdns.com -p69'
alias ssh_router='ssh admin@router'
alias ssh_home='ssh user@bear24rw.gotdns.com -p 44'
alias ssh_school='ssh thrunml@ucfilespace.uc.edu'
alias ssh_tv='ssh media@durknation.gotdns.com -p337'

alias mount_server='sshfs -p69 pwner@durknation.gotdns.com:/ ~/mnt/server'
alias mount_home='sshfs -p44 user@bear24rw.gotdns.com:/ ~/.mnt/backup'
alias mount_desktop='sshfs -p44 user@bear24rw.com:/ ~/mnt/desktop'

alias ls="ls --group-directories-first --color=auto -X -h"
alias ll="ls -l"
alias listbiggest="qsize -a -k | sort -n -k 6"
alias mpdstatus="sudo strace -p `ps x -L | grep mpd | tail -n 2 | head -n 1 | awk '{print $2}'`"

DISTCC_DIR="/var/tmp/portage/.distcc/"
export PYTHONSTARTUP="$HOME/.pythonrc"

RED="\[\033[01;31m\]"
YELLOW="\[\033[01;33m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
WHITE="\[\033[00m\]"

export GIT_PS1_SHOWDIRTYSTATE=1

if [[ ${EUID} == 0 ]] ; then
	PS1='$RED\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1=$GREEN'\u@\h'$BLUE' \w'$YELLOW'$(__git_ps1)'$BLUE' \$ '$WHITE
fi

eval $( dircolors -b $HOME/.ls_colors/LS_COLORS )
