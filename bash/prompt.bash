# Colors
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! ($git_status =~ "working directory clean" || $git_status =~ "working tree clean") ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

# This function builds your prompt. It is called below
function prompt {
  #local CHAR="●﹏●"
  local CHAR=" 🏃 💨 💩 "

  export PS1="\[\e]2;\u-\d\s\a"
  PS1+="[\[\e[0;1m\]\t\[\e[0m\]]"
  PS1+="\[\$(git_color)\]\$(parse_git_branch)"
  PS1+="\[$COLOR_GREEN\]\h:\[\e[0m\]\W\n"
  PS1+="\[\e[0;31m\]$CHAR \[\e[0m\]"
  PS2='> '
  PS4='+ '
}

prompt
