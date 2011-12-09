autoload -U colors &&  colors

#{{{ Tab completion

autoload -Uz compinit && compinit

# color partial completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=0}:${(s.:.)LS_COLORS}")';

#}}}

#{{{ Aliases

alias ssh_server='ssh pwner@durknation.gotdns.com -p69'
alias ssh_router='ssh admin@router'
alias ssh_home='ssh user@bear24rw.gotdns.com -p 44'
alias ssh_school='ssh thrunml@ucfilespace.uc.edu'
alias ssh_tv='ssh media@durknation.gotdns.com -p337'

alias mount_server='sshfs -p69 -o reconnect -o follow_symlinks pwner@durknation.gotdns.com:/ ~/mnt/server'
alias mount_home='sshfs -p44 -o reconnect -o follow_symlinks user@bear24rw.gotdns.com:/ ~/.mnt/backup'
alias mount_desktop='sshfs -p44 -o reconnect -o follow_symlinks user@bear24rw.com:/ ~/mnt/desktop'

alias ls='ls --group-directories-first --color=auto -X -h'
alias ll='ls -l'
alias rrsync='rsync -avz --stats --progress'

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

precmd () { vcs_info }

#}}}

PROMPT='%B%F{green}%n@%m %B%F{blue}%~ ${vcs_info_msg_0_}%F{blue}%# %b%f%k'
