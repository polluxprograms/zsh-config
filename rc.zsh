fpath=(${0:A:h}/themes $fpath)

PLUGIN_DIR="${0:A:h}/plugins"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zvm_after_init_commands+=("bindkey -a 'k' up-line-or-beginning-search" "bindkey -a 'j' down-line-or-beginning-search")
source "$PLUGIN_DIR/zsh-vi-mode/zsh-vi-mode.zsh"
source "$PLUGIN_DIR/zsh-async/async.zsh"

source "${0:A:h}/conda.zsh"
source "${0:A:h}/pollux/init.zsh"

export GPG_TTY="$(tty)"
