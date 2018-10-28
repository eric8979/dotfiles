export PATH=$PATH:/Developer/usr/bin/


##
# Your previous /Users/brentonmorris/.bash_profile file was backed up as /Users/brentonmorris/.bash_profile.macports-saved_2013-07-01_at_19:25:30
##

# MacPorts Installer addition on 2013-07-01_at_19:25:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/brentonmorris/.bash_profile file was backed up as /Users/brentonmorris/.bash_profile.macports-saved_2013-07-11_at_14:33:08
##

# MacPorts Installer addition on 2013-07-11_at_14:33:08: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="~/Scripts:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Set path for golang
export PATH=$PATH:/usr/local/go/bin

# Set custom PS1
export PS1='( \[\e[36;01m\]\h\[\e[0m\] ) [ \[\e[34;01m\]\w\[\e[0m\] ]\n\[\e[31;01m\]-> \[\e[0m\]'

# Set color for directories
export CLICOLOR=1
# use yellow for directories
export LSCOLORS=dxfxcxdxbxegedabagacad

# Set aliases
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt'
alias tc='/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt'
alias empty='cat /dev/null >'
alias kango='python ~/Frameworks/kango/kango.py'
alias v='vim'
alias e='vim'
alias l='ls'

# Set the gopath and add $GOPATH/bin to path
export GOPATH=/Users/brentonmorris/Development/go
export PATH=$PATH:$GOPATH/bin

