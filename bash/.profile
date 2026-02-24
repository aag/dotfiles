# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Include the Khan Academy profile file if it exists
if [ -f "$HOME/.profile.khan" ]; then
. "$HOME/.profile.khan"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Use env file to add cargo to PATH if it exists
if [ -f "$HOME/.cargo/env" ] ; then
    source "$HOME/.cargo/env"
fi
#
# Add fzf keybindings
if [ -f "$HOME/.fzf.bash" ] ; then
    source "$HOME/.fzf.bash"
fi

# set PATH so it contains go's bin dirs if they exist
if [ -d "$HOME/go/bin" ] ; then
    PATH="$PATH:$HOME/go/bin"
fi

if [ -d "/usr/local/go/bin" ] ; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "/lib/go-1.25/bin" ] ; then
    PATH="$PATH:/lib/go-1.25/bin"
fi

# set PATH so it contains Ruby rbenv's bin if it exists
if [ -d "$HOME/.rbenv/bin" ] ; then
    PATH="$HOME/.rbenv/bin:$PATH"
fi

# set PATH so it contains the Groovy bin dir if it exists
if [ -d "/opt/gradle/gradle-3.4.1/bin" ] ; then
    PATH="/opt/gradle/gradle-3.4.1/bin:$PATH"
fi

# set up NVM if it's installed
if [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Add ROCm bin dir if it exists
if [ -d "/opt/rocm-6.2.0/bin" ] ; then
    PATH=$PATH:/opt/rocm-6.2.0/bin
fi

# Add LM Studio to PATH if it exists
if [ -d "/home/adam/.cache/lm-studio/bin" ] ; then
    PATH="$PATH:/home/adam/.cache/lm-studio/bin"
fi
