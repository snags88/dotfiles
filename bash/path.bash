# PATH
# =====================
# NODE_PATH
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

# MYSQL Path
export MYSQL_PATH="/usr/local/mysql/bin"
# Postgres Path
export PG_PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin"
# The USR_PATHS variable will just store all relevant /usr paths for easier usage
# Each path is seperate via a : and we always use absolute paths.
export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

# We build our final PATH by combining the variables defined above
# along with any previous values in the PATH variable.
export PATH="$MYSQL_PATH:$PG_PATH:$USR_PATHS:$PATH"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# pyenv & virtualenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# phpbrew
if which phpbrew > /dev/null; then [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc; fi

# openssl - Use brew installed openssl instead of system
if which openssl > /dev/null; then export PATH="/usr/local/opt/openssl/bin:$PATH"; fi

# Add Laravel into path
if [ -d "$HOME/.composer/vendor/bin" ]; then export PATH="$HOME/.composer/vendor/bin:$PATH"; fi

# RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
