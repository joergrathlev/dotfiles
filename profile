# Initialization file for login shells

# For homebrew, make sure /usr/local/bin is in front of PATH
if [ -d /usr/local/bin ]; then
    export PATH="/usr/local/bin:$PATH"
    export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
fi

# Set JAVA_HOME
if [ -z "$JAVA_HOME" -a -x "/usr/libexec/java_home" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Set GOPATH
if [ -d "$HOME/Development/go" ]; then
    export GOPATH="$HOME/Development/go"
fi

# Enable rbenv
if [ -x "/usr/local/bin/rbenv" ]; then
    eval "$(/usr/local/bin/rbenv init -)"
fi

# Environment settings
export LC_MESSAGES=en_US.UTF-8
export EDITOR=vim
export MAVEN_OPTS="-Xmx3G"
export HOMEBREW_NO_ANALYTICS=1

# If a local .profile exists, source it
if [ -r ~/.profile_local ]; then
    . ~/.profile_local
fi

# Add Cargo to the PATH
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
