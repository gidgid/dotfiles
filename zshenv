# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Editors
VISUAL="vim"
EDITOR="vim"

export WORKON_HOME=$HOME/.virtualenv
export PROJECT_HOME=$HOME/development
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /home/gideon/.local/bin/virtualenvwrapper.sh



