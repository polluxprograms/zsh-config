# Initialize prompt
autoload -Uz promptinit colors
promptinit
prompt pollux

colors

# Print 
visiblelen(){
  local zero='%([BSUbfksu]|([FK]|){*})'
  echo ${#${(S%%)1//$~zero/}}
}

center(){
  TEXT=$(print -P "$1")
  LENGTH=$(visiblelen "$1")
  printf "%$(( ( $(tput cols) - $LENGTH ) / 2 + ${#TEXT} ))s\n" "$TEXT"
}

clear
echo
center "~ welcome, %F{magenta}%B$USER%b%f ~"
echo
