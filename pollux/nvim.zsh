export EDITOR=nvim

nvim () {
  if [ -z "$@" ]; then
    nvr -c 'enew'
  else
    nvr $@
  fi
}
