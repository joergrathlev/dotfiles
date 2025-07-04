# Initialization file for interactive bash shells

# Bash also reads .bashrc for non-interactive shells if they're remote shells.
# Exit if this is not an interactive shell.
if [[ $- != *i* ]]; then return; fi


# Aliases
# =======

alias ..='cd ..'
alias ...='cd ../..'
if [[ `uname` == 'Darwin' ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias l='ls'
alias la='ls -A'
alias ll='ls -lA'
alias vi='vim'
alias grep='grep --color=auto'
alias dstore-cleanup='find . -type f -name .DS_Store -delete'
alias mvnd='MAVEN_OPTS="$MAVEN_OPTS -agentlib:jdwp=transport=dt_socket,server=y,address=9186" mvn'
alias javad='java -agentlib:jdwp=transport=dt_socket,server=y,address=9186'
alias timestamp='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias serve='python -m SimpleHTTPServer'
alias tidy-xml='tidy -xml -quiet -indent'
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read().strip()))"'
alias urldecode='python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read().strip()))"'
alias histgrep='history|grep'
alias aws-login='export AWS_PROFILE=$(aws configure list-profiles | fzf --prompt "Choose active AWS profile:") && aws sso login'


# Bash configuration
# ==================

# Shell history
HISTCONTROL=ignoreboth
HISTFILESIZE=10000
HISTSIZE=10000
HISTIGNORE='exit:logout'
HISTTIMEFORMAT='%Y-%m-%dT%H:%M:%S '
PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND};}history -a"

# Append to the history file, don't overwrite it
shopt -s histappend

# Don't check for new mail
unset MAILCHECK

# Check the window size after each command
shopt -s checkwinsize


# Autocompletion
# ==============

# Ignore backup files in autocompletion
export FIGNORE='~'

# Initialze Bash completion
if [[ -f "/usr/local/etc/bash_completion" ]]; then
    . /usr/local/etc/bash_completion
elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

if [[ -f "/usr/local/bin/aws_completer" ]]; then
    complete -C "/usr/local/bin/aws_completer" aws
fi

# CDPATH
CDPATH=.:$HOME/Development/projects


# Shell functions
# ===============

# Create a directory and change into it
mkcd() {
    [ -n "$1" ] && mkdir -p "$1" && cd "$1"
}

# Run a command with a different JAVA_HOME
jv() {
    if [ "$#" -eq "0" ]; then
        /usr/libexec/java_home -V
        return 0
    elif [ "$#" -lt "2" ]; then
        echo "Usage: jv <version> <command>" >&2
        return 1
    fi
    local -x JAVA_HOME
    JAVA_HOME=$(/usr/libexec/java_home -v "$1")
    if [ "$?" -ne "0" ]; then
        return 1
    fi
    shift
    "$@"
}

aws-docker-login() {
    local account=$(aws configure get sso_account_id)
    local region=$(aws configure get region)
    aws ecr get-login-password --region "${region}" | docker login --username AWS --password-stdin "${account}.dkr.ecr.${region}.amazonaws.com"
}

# Colorized man pages
# from Lemont Washington https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
       	LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# Interactive jq
fjq() {
    echo '' | fzf --print-query --preview "cat \"$1\" | jq {q}"
}


# Shell prompt
# ============

# Colors used in the prompt
COL_RED='\[\e[0;31m\]'
COL_BLUE='\[\e[0;34m\]'
COL_OFF='\[\e[0m\]'

# If this is a remote shell, display the hostname as part of the prompt
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    PROMPT_HOSTNAME="\u@\h:"
fi

# Show git info in the prompt if __git_ps1 is available (it should be part of
# the bash completions loaded above)
if declare -f __git_ps1 >/dev/null; then
    PROMPT_GIT='$(__git_ps1)'
    export GIT_PS1_SHOWSTASHSTATE=yes
    export GIT_PS1_SHOWDIRTYSTATE=yes
fi

# Color the prompt red if the last command exited with a non-zero status
PROMPT_ERR_COLOR='$(if [[ "$?" != "0" ]];then echo "'${COL_RED}'";fi)'

# Update the window title to show the current directory
WINDOW_TITLE='\[\e]0;'${PROMPT_HOSTNAME}'\w\007\]'

# Set the prompt
PS1="${WINDOW_TITLE}${COL_BLUE}${PROMPT_ERR_COLOR}${PROMPT_HOSTNAME}\w${PROMPT_GIT}\$${COL_OFF} "

unset COL_RED COL_BLUE COL_OFF PROMPT_HOSTNAME PROMPT_GIT PROMPT_ERR_COLOR WINDOW_TITLE


# Misc
# ====

# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)


# Local configuration
# ===================

if [[ -r ~/.bashrc_local ]]; then
    . ~/.bashrc_local
fi
