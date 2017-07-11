# Aliases. Set env variables in ~/.localrc
# =====================
  alias l='ls -lah'
  alias flatiron="cd /Users/$USER/Development/flatiron/code/$@"
  alias curology="cd /Users/$USER/Development/curology/code/$@"
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
  alias ssh-production="eb ssh production --force -e 'ssh -i \"$SSH_KEYFILE\"'"
  alias ssh-staging="eb ssh staging --force -e 'ssh -i \"$SSH_KEYFILE\"'"
  alias ssh-jenkins="ssh -i '$SSH_JENKINS' $JENKINS_SERVER"

  # Curology test alias
  alias unit="./tests/scripts/run_tests.sh local testing --unit"
  alias units="./tests/scripts/run_tests.sh local testing --stop"
  alias unitf="./tests/scripts/run_tests.sh local testing --filter"
  alias unitp="vendor/bin/paratest -p20 tests/unit"

  # Curology Ember app
  alias appstart="cd /Users/$USER/Development/curology/code/PocketDerm/resources/assets/patient-frontend && ./serve.sh curology.dev curology"
