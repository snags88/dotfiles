# Aliases. Set env variables in ~/.localrc
# =====================
  alias l='ls -lah'
  alias flatiron="cd /Users/$USER/Development/flatiron/code/$@"
  alias desktop="cd /Users/$USER/Desktop/$@"
  alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

  # Standard Rails
  alias rc='rails c'
  alias rs='rails s'
  alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'

  # Zeus Rails
  alias zstart='zeus start'
  alias zs='zeus s'
  alias zc='zeus c'
  alias zg='zeus g'
  alias zmigrate='zeus rake db:migrate && zeus rake db:migrate RAILS_ENV=test'

  # SSH shortcuts
  alias ssh-production="ssh seiji@$PRODUCTION"
  alias ssh-staging="ssh seiji@$STAGING"
  alias ssh-qa="ssh seiji@$QA"
  alias ssh-nitrous="ssh seiji@$NITROUS"

