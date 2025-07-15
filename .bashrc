# Add to ~/.bashrc for prompt

COLOR_DEF='\[\e[0m\]'
COLOR_DIR='\[\e[38;5;197m\]'
COLOR_GIT='\[\e[38;5;39m\]'

parse_git_branch() {
  git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# Set the prompt
PS1="${COLOR_DIR}\w ${COLOR_GIT}\$(parse_git_branch)${COLOR_DEF}🛠️  "

