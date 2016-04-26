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
export HOMEBREW_NO_ANALYTICS=1

# Export Docker settings if docker-machine is running
if [ -x "/usr/local/bin/docker-machine" -a "$(/usr/local/bin/docker-machine status dev)" = "Running" ]; then
    eval "$(docker-machine env dev)"
fi

# If a local .profile exists, source it
if [ -r ~/.profile_local ]; then
    . ~/.profile_local
fi
