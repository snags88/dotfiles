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
  alias rmigrate='rake db:migrate && rake db:migrate RAILS_ENV=test'

  # Zeus Rails
  alias zstart='zeus start'
  alias zs='zeus s'
  alias zc='zeus c'
  alias zg='zeus g'
  alias zmigrate='zeus rake db:migrate && zeus rake db:migrate RAILS_ENV=test'

  # Artisan
  alias tinker='php artisan tinker'
  alias pmigrate='php artisan migrate'

  # SSH shortcuts
  alias ssh-production="heroku run bash --app=$PRODUCTION_NAME"
  alias ssh-staging="heroku run bash --app=$STAGING_NAME"

  # Curology test alias
  alias testsetup="./tests/scripts/phpunit_setup.sh root testing"
  alias testall="./tests/scripts/phpunit.sh --unit"
  alias tests="./tests/scripts/phpunit.sh --stop"
  alias testf="./tests/scripts/phpunit.sh --filter"
  alias testp="vendor/bin/paratest -p14 tests/Unit"
  alias testw="phpunit-watcher watch --filter="

  alias unit="./tests/scripts/run_tests.sh local testing --unit"
  alias units="./tests/scripts/run_tests.sh local testing --stop"
  alias unitf="./tests/scripts/run_tests.sh local testing --filter"
  alias unitd="./tests/scripts/run_tests.sh local testing --debug"
  alias unitp="vendor/bin/paratest -p20 tests/unit"

  # Curology Ember app
  alias appstart="cd /Users/$USER/Development/curology/code/PocketDerm/resources/assets/patient-frontend && ./serve.sh curology.localhost curology"
