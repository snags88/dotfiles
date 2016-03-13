# Aliases
# =====================
  alias l='ls -lah'
  alias rc='rails c'
  alias rs='rails s'
  alias ssh-production="ssh seiji@$PRODUCTION"
  alias ssh-staging="ssh seiji@$STAGING"
  alias ssh-qa="ssh seiji@$QA"
  alias ssh-nitrous="ssh seiji@$NITROUS"
  alias flatiron="cd /Users/$USER/Development/flatiron/code/$@"
  alias desktop="cd /Users/$USER/Desktop/$@"
  alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
  alias migrate="rake db:migrate && rake db:migrate RAILS_ENV=test"
