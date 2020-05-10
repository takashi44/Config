source ~/.aliases

#export PROMPT="[%n@%m] %~"$'\n'"> "

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt
setopt PROMPT_SUBST
PROMPT='[%n@%m] %~ %F{green}${vcs_info_msg_0_}%f'$'\n''> '
