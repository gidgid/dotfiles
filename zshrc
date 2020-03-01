# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

path+=/home/$USER/bin
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="spaceship"

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
plugins=(z vi-mode zsh-syntax-highlighting zsh-autosuggestions colored-man-pages docker python pip helm)

PATH=$PATH:/usr/local/sbin

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

bindkey 'jk' vi-cmd-mode

export EDITOR="vim"
export VISUAL="vim"
export USE_EDITOR="vim"

fpath=(/usr/local/share/zsh-completions $fpath)

fpath+=($ZSH/plugins/docker)
autoload -U compinit && compinit

#function zle-keymap-select zle-line-init
#{
#    # change cursor shape in iTerm2
#    case $KEYMAP in
#        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
#        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
#    esac
#
#    zle reset-prompt
#    zle -R
#}
#
#function zle-line-finish
#{
#    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
#}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.funcs ] && source ~/.funcs
[ -f ~/.work_aliases ] && source ~/.work_aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZE_DEFAULT_OPS="--extended" # enable us to use regex when matching on results like txt$

export FZF_DEFAULT_COMMAND='ag -g ""'

SPACESHIP_BATTERY_SHOW=false

export PATH="/home/gideon/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval $(thefuck --alias)

source <(kubectl completion zsh | sed s/kubectl/kc/g)
