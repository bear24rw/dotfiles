# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
source /etc/profile.d/bash-completion.sh
export PATH="/usr/lib/distcc/bin:/media/other/xilinx/ISE_DS/ISE/bin/lin/:/home/user/scripts/:${PATH}"
export PATH="/home/user/eagle-5.10.0/bin/:${PATH}"
#export LD_LIBRARY_PATH="/home/user/compiled/libXinerama-1.1.1/root/lib:/opt/cuda/sdk/C/lib:/usr/local/lib64:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="/opt/cuda/sdk/C/lib:/usr/local/lib64:${LD_LIBRARY_PATH}"
export LDPATH="/opt/cuda/sdk/C/lib:/usr/local/lib64:${LDPATH}"

export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig:${PKG_CONFIG_PATH}"


alias ssh_server='ssh pwner@durknation.gotdns.com -p69'
alias ssh_router='ssh admin@router'
alias ssh_home='ssh user@bear24rw.gotdns.com -p 44'
alias ssh_school='ssh thrunml@ucfilespace.uc.edu'

alias mount_server='sshfs -p69 pwner@durknation.gotdns.com:/ ~/mnt/server'
alias killflash='killall npviewer.bin'
alias flashpic="pk2cmd -P pic16f887 -M -T -Y -F"
alias listbiggest="qsize -a -k | sort -n -k 6"
alias nano="nano -w"
alias nesemu="fceux --xscale 4 --yscale 4 "
alias ls="ls --group-directories-first --color=auto -X -h"
alias ll="ls -l"
alias mpdstatus="sudo strace -p `ps x -L | grep mpd | tail -n 2 | head -n 1 | awk '{print $2}'`"
alias checkxinerama="xdpyinfo -ext XINERAMA"

DISTCC_DIR="/var/tmp/portage/.distcc/"
export PYTHONSTARTUP="/home/user/.pythonrc"

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

eval $( dircolors -b $HOME/LS_COLORS/LS_COLORS )

