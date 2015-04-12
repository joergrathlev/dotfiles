# Bash initialization file for login shells

# source ~/.profile
if [ -r ~/.profile ]; then
    . ~/.profile
fi

# Bash does not read .bashrc for interactive login shells. Source it if this is
# an interactive shell, so it is read for all interactive shells.
case "$-" in
    *i*)
        if [ -r ~/.bashrc ]; then
            . ~/.bashrc;
        fi
    ;;
esac
