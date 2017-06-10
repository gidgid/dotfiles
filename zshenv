#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Editors
VISUAL="vim"
EDITOR="vim"

# ============ Shell aliases ===============
alias grep="grep -irn --color"
alias loh="ls -ld .?*"
alias trl="tree -L"
alias vimrc="vim ~/.vimrc"
alias zshenv="vim ~/.zshenv"
alias galias="git_aliases | separate_alias_to_key_value | format_and_color_alias_output"
alias zalias="zsh_aliases | remove_alias_prefix_and_convert_equals_to_spaces | format_and_color_alias_output"
alias g="git"
alias v="vim"
alias r="rails"
alias zshrc="vim ~/.zshrc"
alias rmt="rake_prepare_and_migrate"
alias rs="rspec spec"
alias rsff="rspec spec --fail-fast"
alias s="sbt"
alias seca="set -e && sbt clean && sbt assembly"
alias refzsh="source ~/.zshenv"
alias rc="rubocop"

git_aliases() {
  git config --get-regexp '^alias\.'
}

zsh_aliases() {
  cat ~/.zshenv | grep -i "^alias\s.*$" | awk -F: '{ print $3 }'
}

remove_alias_prefix_and_convert_equals_to_spaces() {
  awk '{ $1=""; printf "%s\n", $0 }' | awk -F= '{ print $1" "$2 }'
}

separate_alias_to_key_value() {
  awk '{ printf "%s ", $1; printf "\""; for (i=2; i<NF; i++) printf "%s ", $i; printf "%s\"\n", $NF }'
}

format_and_color_alias_output() {
  awk -F\" '{ printf "\033[1;32m%-20s\033[0m %-40s\n", $1, $2 }'
}

rake_prepare_and_migrate() {
  set -e
  echo "running the migration"
  rake db:migrate
  echo "running test prepare"
  rake db:test:prepare
}

