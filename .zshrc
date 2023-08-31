# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
autoload -U colors && colors
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}[%b]%{$reset_color%} "
precmd() { vcs_info }

# Enable substitution in the prompt.
setopt prompt_subst

# Config for the prompt. PS1 synonym.
prompt='%{$fg[magenta]%}%2/%{$reset_color%} ${vcs_info_msg_0_} %{%G🛠️%}  '

alias gst="git status"
alias dc="docker compose"
alias dctest="docker compose run -e RAILS_ENV=test --rm web bundle exec rspec"
alias tat="tmux attach -t"
alias tlist="tmux list-sessions"
alias tnew="tmux new-session -s"
alias ff="vim -c CtrlP"

# Docker completion stuff I guess
autoload -Uz compinit && compinit

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
