# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs


# Added by Toolbox App
export PATH="$PATH:/home/pingvi/.local/share/JetBrains/Toolbox/scripts"
export GOROOT=/usr/local/go            
export PATH=$PATH:$GOROOT/bin
