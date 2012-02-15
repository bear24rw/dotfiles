autoload zmv
autoload -U colors &&  colors

eval $( dircolors -b $HOME/.ls_colors/LS_COLORS )

export PYTHONSTARTUP="$HOME/.pythonrc"

#{{{ Tab completion

autoload -Uz compinit && compinit

# color partial completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=0}:${(s.:.)LS_COLORS}")';

# add user scripts to path
PATH="${HOME}/.scripts/:${PATH}:"

# add sbin to PATH so sudo can tab complete it
PATH="${PATH}:/sbin/:/usr/sbin/:"

# tab complete known hosts
hosts=(`sed 's/\[\|\]\| .*//g;s/,/\n/g;s/:.*$//g' ~/.ssh/known_hosts | sort | uniq | tr '\n' ' '`)
zstyle ':completion:*:hosts' hosts $hosts

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# kill tab completion
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

#}}}

#{{{ Aliases

alias ssh_server='ssh pwner@durknation.gotdns.com -p69'
alias ssh_router='ssh admin@router'
alias ssh_home='ssh user@bear24rw.gotdns.com -p 44'
alias ssh_school='ssh thrunml@ucfilespace.uc.edu'
alias ssh_tv='ssh media@durknation.gotdns.com -p337'
alias ssh_desktop='ssh user@bear24rw.com -p44'

alias mount_server='sshfs -p69 -o reconnect -o follow_symlinks pwner@durknation.gotdns.com:/ ~/mnt/server'
alias mount_home='sshfs -p44 -o reconnect -o follow_symlinks user@bear24rw.gotdns.com:/ ~/.mnt/backup'
alias mount_desktop='sshfs -p44 -o reconnect -o follow_symlinks user@bear24rw.com:/ ~/mnt/desktop'

alias ls='ls --group-directories-first --color=auto -X -h --classify'
alias ll='ls -l'
alias rrsync='rsync -avz --stats --progress'
alias grep='grep --color'
alias egrep='egrep --color'
alias df='df -h'
alias watch='watch -n1 -d --color'

alias lower='tr "[:upper:]" "[:lower:]"'
alias upper='tr "[:lower:]" "[:upper:]"'

#}}}

#{{{ Options

# don't cycle through completions
setopt BASH_AUTO_LIST
setopt NO_AUTO_MENU

# cd=pushd
setopt AUTO_PUSHD
setopt PUSHD_SILENT

# regex like globbing: cp ^*.(tar|bz2|gz)
setopt EXTENDED_GLOB

# don't beep
setopt NO_BEEP

# emacs keybindings
setopt EMACS

# disable ctrl-s (breaks rtorrent)
setopt NO_FLOW_CONTROL

# = is needed for emerge
unsetopt EQUALS

#}}}

#{{{ Key bindings

# home / end keys
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

#}}}

#{{{ History

HISTFILE=~/.history

SAVEHIST=10000
HISTSIZE=10000

# write after each command
setopt INC_APPEND_HISTORY

# share history between multiple shells
setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS

# remove superfluous blanks
setopt HIST_REDUCE_BLANKS

# don't store if command begins with a space
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# don't execute a history expansion, just show it
setopt HIST_VERIFY

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

#}}}

#{{{ VCS info in PS1

# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

# execute commands in PS1
setopt PROMPT_SUBST

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%F{yellow}(%b%c%u%F{yellow}) '

#}}}

#{{{ Terminal title

function title_job() {
    if [[ $TERM == 'screen'* ]]; then
        print -Pn "\ek${1//\\/\\\\}\e\\"
    else
        print -Pn "\e]0;${1//\\/\\\\}\a"
    fi
}


function title_path() {
    if [[ $TERM == 'screen'* ]]; then
        print -Pn "\ek%~\e\\"
    else
        print -Pn "\e]0;%n@%m: %~\a"
    fi
}

# set the intial title
title_path

#}}}

precmd() { vcs_info; title_path; }

preexec() { title_job $1; }

PROMPT='%B%(!.%F{red}.%F{green})%n@%m %B%F{blue}%~ ${vcs_info_msg_0_}%F{blue}%# %b%f%k'