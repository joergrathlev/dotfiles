# Dotfiles

These are my dotfiles.

## Installation

Clone this repository, then run the included `install.sh` shell script. It will
create symlinks from your home directory to the files in this project.

**WARNING: `install.sh` *will* overwrite existing files in your home
directory.** It is deliberately a very simple script. More sophisticated
solutions for managing dotfiles are available, but this works for me.

## Local configuration

`.profile` and `.bashrc` source `.profile_local` and `.bashrc_local`, if
present. I use these files for local, machine-specific configuration and for
settings which I don't want in source control (for example, environment
variables that contain secrets).

The `.gitconfig` includes `.gitconfig_local`, which I use to set the name and
email for Git.

## Managing your own dotfiles

If you want to create your own dotfiles, feel free to use mine as a starting
point, or simply copy & remix the parts that you like. I also recommend
[dotfiles.github.io](http://dotfiles.github.io/), it is a great place to get
started and to discover other people's dotfiles.
