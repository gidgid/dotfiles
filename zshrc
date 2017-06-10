# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-noalias rvm z colored-man brew)

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath=(~/.zsh/Completion $fpath)
# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"
#
# # if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT
#
# # allows you to type Bash style comments on your command line
# # good 'ol Bash
setopt interactivecomments
#
# # Zsh has a spelling corrector
setopt CORRECT

export EDITOR="vim"
export VISUAL="vim"
export USE_EDITOR="vim"

fpath=(/usr/local/share/zsh-completions $fpath)

PATH=$PATH:$HOME/.rvm/bin

function execute-on-revisions {
  if [ $# -eq 0 ]; then
    echo "Missing <start-rev-exclusive> and <end-rev-inclusive>"
    exit 1
  fi

  startbranch=$(git name-rev --name-only HEAD)
  echo "Invoked from branch: $startbranch. When done executing on all revisions will return to the start branch"

  start_rev_exclusive=$1
  end_rev_inclusive=$2
  git rev-list $start_rev_exclusive...$end_rev_inclusive --reverse | while read rev; do set -e && git co $rev && eval $3; done

  echo "Finished execution on all revisions. Returning to $startbranch"
  git co $startbranch
}

function equal-line-count {
  if [ $# -eq 0 ]; then
    echo "Missing <file1> and <file2> to compare lines"
    exit 1
  fi

  file1_lines_count=$(wc -l "$1" | awk '{ print $1 }')
  file2_lines_count=$(wc -l "$2" | awk '{ print $1 }')
  if [ "$file1_lines_count" -eq "$file2_lines_count" ]; then
    echo "Both files have the same number of lines";
  else
    echo "Files don't have the same line number. First file has #$file1_lines_count lines while second file has #$file2_lines_count lines";
  fi
}

function run-on-modified-files {
  if [ $# -eq 0 ]; then
    echo "Expecting <branch-name> and <command-to-execute>"
    exit 1
  fi

  branch_to_run_on="$1"
  command_to_run="$2"

  echo "Finding modified files on branch: $branch_to_run_on from master"
  git checkout $branch_to_run_on

  $(git dfnames master) | while read in_file; do echo "on file: $in_file"; done

  echo "Done"
  exit 0
}
