# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bunni/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bunni/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bunni/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bunni/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export DOCKER_BUILDKIT=0

# Enable vi mode
bindkey -v
bindkey '^r' history-incremental-search-backward
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# ENV variables
export iCloud="~/Library/Mobile\ Documents/"
export VISUAL=nvim

# aliases
alias ls="ls -G"
alias fzfc="fzf -m | xargs code"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
