fpath=(${0:A:h}/themes $fpath)

source "${0:A:h}/pollux/init.zsh"

PLUGIN_DIR="${0:A:h}/plugins"
source "$PLUGIN_DIR/zsh-vi-mode/zsh-vi-mode.zsh"
source "$PLUGIN_DIR/zsh-async/async.zsh"

autoload -U compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %d%b'

export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups
setopt hist_ignore_space


setopt autocd
setopt extendedglob

export GPG_TTY="$(tty)"
export EDITOR="nvim"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pollux/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pollux/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pollux/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pollux/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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
