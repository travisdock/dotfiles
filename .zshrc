COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

alias gst="git status"
alias dc="docker compose"
#alias dctest="docker compose run --rm web 'RAILS_ENV=test bundle exec rspec '"
alias tat="tmux attach -t"
alias tlist="tmux list-sessions"
alias tnew="tmux new-session -s"
# Prompt with git from https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29
function parse_git_branch() {
      git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
function dctest() {
  docker compose run --rm web "RAILS_ENV=test bundle exec rspec $1"
}

# Docker completion stuff I guess
autoload -Uz compinit && compinit

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
