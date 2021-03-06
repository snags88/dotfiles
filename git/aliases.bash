# Use `hub` as our git wrapper:
#   https://github.com/github/hub
if test $(which hub)
then
  eval "$(hub alias -s)"
fi

# Git
alias gcl="git clone"
alias gst="git status"
alias gl="git pull"
alias glr="git pull --rebase"
alias gr="git rebase"
alias gp="git push"
alias gd="git diff | mate"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gcam="git commit -am"
alias gbb="git branch -b"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gbw="git browse"
alias gpr="git pull-request"
