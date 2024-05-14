fpath=(${0:A:h}/themes $fpath)

source "${0:A:h}/conda.zsh"
source "${0:A:h}/pollux/init.zsh"

PLUGIN_DIR="${0:A:h}/plugins"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zvm_after_init_commands+=("bindkey -a 'k' up-line-or-beginning-search" "bindkey -a 'j' down-line-or-beginning-search")
source "$PLUGIN_DIR/zsh-vi-mode/zsh-vi-mode.zsh"


source "$PLUGIN_DIR/zsh-async/async.zsh"

autoload -Uz compinit promptinit

promptinit
prompt pollux

compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %d%b'


setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt extendedglob

export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export GPG_TTY="$(tty)"
export EDITOR="nvim"

nvim ()
{
 if [ -z "$NVIM" ]; then
    /usr/bin/nvim $@
  else
    if [ -z "$@" ]; then
      nvr --servername $NVIM -c 'enew'
    else
      nvr --servername $NVIM --remote $@
    fi
  fi
}

# Initialize
cbonsai -p
echo
