# ============================================================================
# ZSH Configuration
# Base configuration for dotfiles repo - shared across machines
# ============================================================================

# ----------------------------------------------------------------------------
# Load Environment Variables (from .zprofile)
# ----------------------------------------------------------------------------
# In login shells, .zprofile is already sourced
# In non-login shells (like new terminal tabs), we need to source it manually
if [[ -f ~/.zprofile ]] && [[ -z "$ZPROFILE_LOADED" ]]; then
    source ~/.zprofile
fi

# ----------------------------------------------------------------------------
# Colors
# ----------------------------------------------------------------------------
# Enable colors in terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enable colored output for ls, grep, etc.
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS uses BSD ls
    alias ls='ls -G'
else
    # Linux uses GNU ls
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ----------------------------------------------------------------------------
# Prompt with Git Information
# ----------------------------------------------------------------------------
# Enable prompt substitution
setopt PROMPT_SUBST

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' on %F{cyan}%b%f'
zstyle ':vcs_info:git:*' actionformats ' on %F{cyan}%b%f (%F{red}%a%f)'

# Set up the prompt with git info
# Format: [user@host:directory on branch]$
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f${vcs_info_msg_0_}%(!.#.$) '

# ----------------------------------------------------------------------------
# History Configuration
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt APPEND_HISTORY          # Append to history file, don't overwrite
setopt SHARE_HISTORY          # Share history between all sessions
setopt HIST_IGNORE_DUPS       # Don't record duplicate entries
setopt HIST_IGNORE_ALL_DUPS   # Delete old duplicates
setopt HIST_FIND_NO_DUPS      # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks
setopt HIST_VERIFY            # Don't execute immediately upon history expansion

# ----------------------------------------------------------------------------
# Completion System
# ----------------------------------------------------------------------------
# Load and initialize the completion system
autoload -Uz compinit
compinit

# Completion options
setopt COMPLETE_IN_WORD       # Complete from both ends of a word
setopt ALWAYS_TO_END          # Move cursor to end if word had one match
setopt AUTO_MENU              # Show completion menu on successive tab press
setopt AUTO_LIST              # Automatically list choices on ambiguous completion
setopt COMPLETE_ALIASES       # Complete aliases

# Make completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Use menu selection for completion
zstyle ':completion:*' menu select

# Colorful completion listings
zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"

# ----------------------------------------------------------------------------
# Directory Navigation
# ----------------------------------------------------------------------------
setopt AUTO_CD                # cd by just typing the directory name
setopt AUTO_PUSHD            # Push directories onto the directory stack
setopt PUSHD_IGNORE_DUPS     # Don't push duplicate directories
setopt PUSHD_SILENT          # Don't print directory stack after pushd/popd

# ----------------------------------------------------------------------------
# Useful Aliases
# ----------------------------------------------------------------------------

# ls aliases
alias ll='ls -lah'                   # Long format, all files, human-readable sizes
alias la='ls -lAh'                   # Long format, all files (except . and ..)
alias l='ls -CF'                     # Columnar format with file type indicators
alias lsa='ls -lah'                  # Long format, all files including hidden

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Safe operations
alias rm='rm -i'                     # Confirm before removing
alias cp='cp -i'                     # Confirm before overwriting
alias mv='mv -i'                     # Confirm before overwriting

# Shortcuts
alias h='history'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}' # Print PATH with each entry on a new line

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# Disk usage
alias du='du -h'
alias df='df -h'

# Find large files
alias findlarge='find . -type f -size +100M -exec ls -lh {} \;'

# ----------------------------------------------------------------------------
# Key Bindings
# ----------------------------------------------------------------------------
# Use emacs key bindings (can change to 'bindkey -v' for vi mode)
bindkey -v

# Reduce mode switch delay (default 0.4s feels sluggish)
export KEYTIMEOUT=1

# Show which mode you're in via cursor shape
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q'  # block cursor for normal mode
  else
    echo -ne '\e[5 q'  # beam cursor for insert mode
  fi
}
zle -N zle-keymap-select

# ----------------------------------------------------------------------------
# Environment Variables
# ----------------------------------------------------------------------------
# Set default editor
export EDITOR='nvim'
export VISUAL='nvim'

# Better less defaults
export LESS='-R -i -M -w -X'

# ----------------------------------------------------------------------------
# Per-Machine Custom Configuration
# ----------------------------------------------------------------------------
# Source machine-specific aliases and configurations
# Create a ~/.zshrc.local file on each machine for custom settings
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

# Alternative: source a .zsh_aliases file if it exists
if [[ -f ~/.zsh_aliases ]]; then
    source ~/.zsh_aliases
fi

# ----------------------------------------------------------------------------
# Additional Enhancements (optional, uncomment if desired)
# ----------------------------------------------------------------------------

# Auto-correction for commands (uncomment to enable)
# setopt CORRECT
# setopt CORRECT_ALL

# Enable extended globbing (useful for advanced pattern matching)
setopt EXTENDED_GLOB

# Case-insensitive globbing
setopt NO_CASE_GLOB

# Disable beep
unsetopt BEEP

# ----------------------------------------------------------------------------
# Platform-Specific Settings
# ----------------------------------------------------------------------------
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS-specific settings
    # (Homebrew is initialized in .zprofile)
    :
fi
export PATH="$HOME/.local/bin:$PATH"
