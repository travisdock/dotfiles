# Docker completion stuff I guess
autoload -Uz compinit && compinit
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Prompt with git from https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29
COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
function parse_git_branch() { git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p' }
setopt PROMPT_SUBST
# This fixed my emoji problems
# https://github.com/ohmyzsh/ohmyzsh/issues/7945#issuecomment-508724741
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}%{%G🛠️%}  '

# Aliases
alias gst="git status"
alias gfp="git fetch --prune"
alias dc="docker compose"
alias dctest="docker compose run -e RAILS_ENV=test --rm web bundle exec rspec"
alias tat="tmux attach -t"
alias tlist="tmux list-sessions"
alias tnew="tmux new-session -s"
alias ff="vim -c CtrlP"

