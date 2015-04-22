#[[ -f ~/.bashrc ]] && . ~/.bashrc
#[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
#[[ -f ~/.git-completion.bash ]] && . ~/.git-completion.bash
#[[ -f ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
case "$TERM" in
    xterm-*color) color_prompt=yes;;
esac

PS1="\[\033[0;32m\]\u@\h\[\033[0;33m\]\$(__git_ps1 \" [%s]\")\[\033[0m\] \w\$ "

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
