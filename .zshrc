export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(nodenv init -)"

autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


PROMPT='%{$fg[cyan]%}%n@%m%{$reset_color%} %{$fg[magenta]%}[$(date +"%a, %b %d %T")]%{$reset_color%} %{$fg[yellow]%}%~/%{$reset_color%} %{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}
λ '

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/me/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# add postgres to PATH
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
