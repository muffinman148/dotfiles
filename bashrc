export CLICOLOR=1   # simply enables coloring of your terminal.
export LSCOLORS=GxFxCxDxBxegedabagaced  # specifies how to color specific items
export EDITOR=/usr/bin/vim

########################################
# Aliases
########################################

# some more ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias lc='ls -AlhtU'
alias lt='ls -hAlt'

# can also redefine a command to change default options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias h='history'
alias up='cd ..'
alias tart='tar -tzvf'   # List file in archive
alias tarc='tar -czvf'   # archive to file and gzip
alias tarx='tar -xzvf'   # unarchive and ungzip
# some apple script
alias unmute="osascript -e 'set volume output muted false'"
alias mute="osascript -e 'set volume output muted true'"
# Dramatically improve grep performance - temporarily set collation to ascii
# For grep version older than 2.7
# Prepend 'LC_ALL=C'
# ex. LC_ALL=C frep 'asdf' *.txt
alias grep='LC_ALL=C grep'
alias fgrep='LC_ALL=C fgrep'
alias egrep='LC_ALL=C egrep'
alias less='less -MRS'
alias phptools='php /Volumes/unified/tools/createSqlForModel.php'
alias gitvundle='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
alias info='info --vi-keys'
alias getsw='system_profiler SPSoftwareDataType'
alias gethw='system_profiler SPHardwareDataType'

# Quick Paths
alias schoolPath='cd ~/Documents/_SchoolStuff/'
alias workPath='cd ~/Documents/Adobe/Projects/'
alias dropboxPath='cd ~/Dropbox\ -\ Personal/Dropbox/sharedNotes/'
alias illustratorPath='cd /Applications/Adobe\ Illustrator\ CC\ 2019/Presets.localized/en_US/Scripts/'

# Tmuxp Configurations
alias st='tmuxp load ~/dotfiles/.tmuxp/tmuxp_startup.json'
alias stdnd='tmuxp load ~/dotfiles/.tmuxp/tmuxp_dnd_startup.json'
alias stcss='tmuxp load ~/dotfiles/.tmuxp/tmuxp_css_startup.json'
alias stsc='tmuxp load ~/dotfiles/.tmuxp/tmuxp_school_startup.json'

# Show processes in detail
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# Git
alias gs='git status'
alias g='git status'
alias ga='git add'
alias gc='git commit -v'
alias gd='git diff'
alias gu='git remote update'
alias gsi='git status --i'
alias gl='git log'
alias gca='git commit --amend'
alias gdm='git diff master origin/master'

# Show bash keybindings
alias showkeys="bind -p | grep -v '^#\|self-insert\|^$'"

# Brew Update
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# List SSH Config Hosts
alias sshhosts="printf 'HOST LIST\n---------\n'; grep '^Host' $HOME/.ssh/config | sed 's/Host //'"

# Open and Close Tmux
bind -m vi -x '"OP":"tmux attach-session"' # <F1> Open available tmux session
bind -m vi -x '"OQ":"tmux detach-client"'  # <F2> Closes available tmux session

# Bash completion without strict case
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Todo.txt stuff
#alias t='todo.sh -d $HOME/.todo.cfg'
#complete -F _todo t
#alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/.todo.cfg'
#source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion complete -F _todo t
#export TODOTXT_DEFAULT_ACTION=ls
# Turns auto archive off
#export TODOTXT_AUTO_ARCHIVE=0

# Emacs EVIL
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

########################################
# BASH Variables
########################################
DROPBOX=~/"Dropbox - Personal/Dropbox"
PROJECTS=~/'Documents/Adobe/Projects/'

# or set it and export it in same line

export HISTSIZE=1000				    	# 500 is default
export HISTTIMEFORMAT='%b %d %T  '		    # using strftime
export HISTCONTROL=ignoreboth:erasedups		# ignoredups:ignorespace
export HISTIGNORE="t *:delHistory*:fg:history:history -d*:h:h -d*:pwd:exit:df:ll:ls:man *:"
# append to the history file, don't overwrite it
shopt -s histappend
# allows for recursive listing with ex: **/*.cpp
shopt -s globstar
# cd to a directory the lazy way; accepts mispelling of words... somtimes
shopt -s cdspell
# notify when background process is complete
shopt -o -s notify

# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# GREP_COLOR codes
# Attributes:   Text color:    Background:
#   0 reset all   30 black       40 black
#   1 bright      31 red         41 red
#   2 dim         32 green       42 green
#   4 underscore  33 yellow      43 yellow
#   5 blink       34 blue        44 blue
#   7 reverse     35 purple      45 purple
#   8 hidden      36 cyan        46 cyan
#                 37 white       47 white
# Separate with ";"
#
export GREP_COLOR="1;31;47"

# Specify options grep should use by default
export GREP_OPTIONS="--color=auto"

########################################
# Prompt
########################################

# Functions
showSuspended() {
    if jobs | grep -cq Stopped; 
    then
        printf ' \e[5m♻ \e[25m'
    fi
}

# Initialize Colors
PWDirectory="\[\e[38;5;203;1m\]"
DOLLAR="\[\e[38;5;40;48;5;240;1m\]"
DOLLAR2="\[\e[38;5;220;1m\]"
RESET="\[\e[0m\]" 

SEGDARK="\[\e[38;5;240;48;5;247;1m\]"
SEGLGIHT="\[\e[38;5;247;48;5;240;1m\]"
HOSTCOLOR="\[\e[11;1;247;48;5;240;1m\]"
HOSTCOLOR2="\[\e[38;5;4;1m\]"
GREYEND="\[\e[48;1;0;38;5;240;1m\]"
SUSPENDED="\[\e[38;5;7;48;5;247;1m\]"

# Prompt
if [ $TERM_PROGRAM == "iTerm.app" ]; then # iTerm 
    # BASH Boot
    echo ""
    echo -n "Welcome to Unix on $OSTYPE OS X, "; whoami
    echo ""
    echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
    echo ""
    gcal -H '\e[38;5;1;48;5;7;1m:\e[0m:\e[32m:\e[0m' -q US_CA
    echo -n "Uptime: "; uptime
    echo ""
    echo ""

    MYNAME='muffinrain'
    export MYNAME


    # Neat OS Info 
    if [ -x "$(command -v neofetch)" ]; then 
        neofetch 
    fi

    # Establish Fancy PS1
    PS1="${PWDirectory}\w${RESET}\n${SEGDARK}${SUSPENDED}\$(showSuspended)${SEGDARK} \u ${RESET}${SEGLGIHT} ${HOSTCOLOR}\h ${RESET}${DOLLAR}\$ ${GREYEND}${RESET} "
    bind 'set show-mode-in-prompt on'
    unset PROMPT_COMMAND
else # Other terminal prompts
    PS1="${PWDirectory}\w\n${HOSTCOLOR2}\h ${RESET}${DOLLAR2}\$ ${RESET}"
    bind 'set show-mode-in-prompt off'
    unset PROMPT_COMMAND
fi

########################################
# Readline Options
########################################

# Use vi key bindings instead of emacs
set -o vi
bind -m vi-command '".":insert-last-argument'
bind -m vi-command '"gg":beginning-of-history'
bind -m vi-command '"G":end-of-history'
bind -m vi-command '"u":undo'
bind -m vi-insert  '"\C-l.":clear-screen'
bind -m vi-insert  '"\C-a.":beginning-of-line'
bind -m vi-insert  '"\C-e.":end-of-line'
bind -m vi-insert  '"\C-w.":backward-kill-word'
bind -m vi-insert  '"\C-k.":kill-line'
bind -m vi-insert  '"\C-s.":forward-search-history'
bind -m vi-insert  '"jk":vi-movement-mode'
bind -m vi-insert  '" ": magic-space' # Expands History variables

# vi mode visual
bind 'set vi-ins-mode-string \1\e[38;5;7;48;5;240;1m\2 I \1\e[38;5;240;48;5;247;1m\2\1\e[0m\2'
bind 'set vi-cmd-mode-string \1\e[38;5;7;48;5;166;1m\2 N \1\e[38;5;166;48;5;247;1m\2\1\e[0m\2'

# History Filter
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

########################################
# Useful Functions
########################################

#Path List Format

path() {
    tr : '\n' <<< $PATH
}
export -f path

# For OS X only
function del() {
    for thisArg in "$@"; do
        mv -n "$thisArg" ~/.Trash
    done
}
export -f del

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
#        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
#        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
export -f extract

delHistory() {
    start=$1
    end=$2
    count=$(( end - start ))
    while [[ $count -ge 0 ]] ; do
        history -d "$start" 
        ((count--))
    done
}
export -f delHistory

# This is for your git auto completion
if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

psup() { ps acxo etime,command | grep -- "$1"; }
export -f psup

# File Permissions: Octal Notation
#------------------------------------
#
#		user	group	other
#
#	r	4	4	4
#	w	2	2	0
#	x	1	0	0
#
#	total	7	6	4
#
#	rwxrw-r-- = 764
#
#	rwxr-xr-x = 755
#
#	rwx------ = 700
#
#	rwxr--r-- = 744
#
#	r-------- = 400  (root must change or execute)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH="$PATH:$HOME/.npm-packages/bin" #Removes need for global install

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\e^ihh \n"'; fi
