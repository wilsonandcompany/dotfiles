#export PATH=/usr/local/git/bin:$PATH
source ~/.bashrc

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
case "$TERM" in
  xterm-*color) color_prompt=yes;;
esac

PS1='\[\033[01;32m\]\u@macair\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

# MacPorts Installer addition on 2009-12-31_at_14:19:53: adding an appropriate MANPATH variable for use with MacPorts.
#export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

# MacPorts Installer addition on 2012-03-13_at_14:00:41: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

