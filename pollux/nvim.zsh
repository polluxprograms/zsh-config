export EDITOR=nvim

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
