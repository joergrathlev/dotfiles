# Initialization file for login shells

# For homebrew, make sure /usr/local/bin is in front of PATH
if [ -d /usr/local/bin ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# Set JAVA_HOME
if [ -z "$JAVA_HOME" -a -x "/usr/libexec/java_home" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi

# Set GOPATH
if [ -d "$HOME/Development/go" ]; then
    export GOPATH="$HOME/Development/go"
fi

# Environment settings
export LC_MESSAGES=en_US.UTF-8
export EDITOR=vim
export MAVEN_OPTS="-Xmx3G"

# Export Docker settings if boot2docker is running
if [ -x "/usr/local/bin/boot2docker" -a "$(/usr/local/bin/boot2docker status)" = "running" ]; then
    eval $(/usr/local/bin/boot2docker shellinit 2> /dev/null)
fi

# If a local .profile exists, source it
if [ -r ~/.profile_local ]; then
    . ~/.profile_local
fi
