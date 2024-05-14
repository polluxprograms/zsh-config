autoload -Uz compinit 
setopt extendedglob

compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format 'Sorry, no matches for: %d%b'
