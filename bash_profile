# This only runs on user login


# If you're on a Mac and have been wondering why /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin keeps getting prepended to PATH when you run tmux, it's because of a utility called path_helper that's run from your /etc/profile file.

# You can't easily persuade tmux (or rather, bash) not to source /etc/profile (for some reason tmux always runs as a login shell, which means /etc/profile will be read), but you can make sure that the effects of path_helper don't screw with your PATH.

# The trick is to make sure that PATH is empty before path_helper runs. In my ~/.bash_profile file I have this:
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi
# Clearing PATH before path_helper executes will prevent it from prepending the default PATH to your (previously) chosen PATH, and will allow the rest of your personal bash setup scripts (commands further down .bash_profile, or in .bashrc if you've sourced it from .bash_profile) to setup your PATH accordingly.

########################################
# PATH
########################################

PATHORIG="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/bin"
export PATH=$PATHORIG

########################################
# PHP
########################################
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

########################################
# Python
########################################
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Support for LaTeX
# export PATH="/Library/TeX/Root/bin"

# Possible Fix 2.7 
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

########################################
# Pyenv
########################################

# Allows for the python shell to use Pyenv instead
export PATH="/Users/username/.pyenv:$PATH"
eval "$(pyenv init -)"

########################################
# Brew
########################################
export PATH="/usr/local/sbin:$PATH"

# Enables bash completion on startup
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

########################################
# Onload
########################################

# This loads in the configuration in .bashrc
# Put all configuration there
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Enables Vi-mode for Bash while in Tmux
set -o vi

########################################
# iTerm 
#---------------------------------------
# Note: This must be last.
########################################
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
