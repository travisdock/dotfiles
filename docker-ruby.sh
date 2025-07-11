#!/bin/bash

# Display fun title page
clear
gum style \
    --foreground 212 \
    --border-foreground 212 \
    --border double \
    --align center \
    --width 50 \
    --margin "1 2" \
    --padding "2 4" \
    '╔╦╗┌─┐┌─┐┬┌─┌─┐┬─┐  ╦═╗┬ ┬┌┐ ┬ ┬' \
    ' ║║│ ││  ├┴┐├┤ ├┬┘  ╠╦╝│ │├┴┐└┬┘' \
    '═╩╝└─┘└─┘┴ ┴└─┘┴└─  ╩╚═└─┘└─┘ ┴ '

gum style \
    --foreground 199 \
    --align center \
    --italic \
    "Ruby Development Environment Manager"

echo
gum style \
    --foreground 99 \
    --align center \
    "🐳 Docker + 💎 Ruby = ❤️"

echo
gum spin --spinner dot --title "Initializing..." -- sleep 1

# Ask for container name
CONTAINER_NAME=$(gum input --placeholder "Container name (leave empty for default)")

# Add --name flag if a name was provided
if [ -n "$CONTAINER_NAME" ]; then
    NAME_OPTION="--name $CONTAINER_NAME"
else
    NAME_OPTION=""
fi

# Ask if this is an IRB session
SESSION_TYPE=$(gum choose "IRB session" "Bash session" --header "What type of session?")

# Select Ruby version
RUBY_VERSION=$(gum choose "3.4" "3.3" "3.2" "3.1" "3.0" "2.7" --header "Select Ruby version:")

if [ "$SESSION_TYPE" = "IRB session" ]; then
    # For IRB, just run the container with irb
    DOCKER_CMD="docker run -it --rm $NAME_OPTION ruby:${RUBY_VERSION} irb"
else
    # For Bash session, ask about mounting and ports
    if gum confirm "Mount current directory as /app?"; then
        MOUNT_OPTION="-v $(pwd):/app"
        WORKDIR_OPTION="-w /app"
    else
        MOUNT_OPTION=""
        WORKDIR_OPTION=""
    fi

    # Ask if user wants to expose port 3000
    if gum confirm "Open port 3000 for Rails app?"; then
        PORT_OPTION="-p 3000:3000"
    else
        PORT_OPTION=""
    fi

    # Build the docker command for bash
    DOCKER_CMD="docker run -it --rm $NAME_OPTION $MOUNT_OPTION $WORKDIR_OPTION $PORT_OPTION ruby:${RUBY_VERSION} bash"
fi

# Show the command that will be executed
echo
gum style --foreground 212 --bold "Executing:"
echo "$DOCKER_CMD"
echo

# Execute the docker command
eval $DOCKER_CMD
