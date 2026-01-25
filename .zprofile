# ============================================================================
# ZSH Profile - Environment Setup
# Loaded once per login shell (and sourced by .zshrc for non-login shells)
# ============================================================================

# Mark that this file has been loaded (prevents double-sourcing)
export ZPROFILE_LOADED=1

# ----------------------------------------------------------------------------
# Homebrew Environment
# ----------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# ----------------------------------------------------------------------------
# NVM (Node Version Manager)
# ----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ----------------------------------------------------------------------------
# Pyenv (Python Version Manager)
# ----------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
