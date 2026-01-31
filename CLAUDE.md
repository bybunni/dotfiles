# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository configuring Neovim, Vim, Zsh, Tmux, and VSCode. No build system or tests — changes are deployed by copying files to `~/.config/` and `~/`.

## Setup

Neovim (primary editor):
```
cp -R dotfiles/.config/nvim/ ~/.config/
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

LSP servers are installed inside Neovim via `:Mason`. Python tooling requires: `pynvim`, `python-lsp-server`, `python-lsp-black`.

Shell configs are copied directly: `cp .zshrc .zprofile ~/`

## Architecture

- **`.config/nvim/init.lua`** — Single-file Neovim config using Packer. Contains all plugin declarations, LSP setup (Mason + lspconfig), Treesitter, Telescope, Neo-tree, and keybindings. Leader key is `<Space>`.
- **`.vimrc`** — Legacy Vim config with vim-plug, YouCompleteMe, and lightline. Largely superseded by the Neovim config.
- **`.zshrc` / `.zprofile`** — Zsh with git-aware prompt via `vcs_info`, aliases (git shortcuts: `gs`, `ga`, `gc`, `gp`, `gl`, `gd`, `gco`, `gb`), and machine-specific overrides loaded from `~/.zshrc.local` or `~/.zsh_aliases`.
- **`settings.json`** — VSCode settings with Vim extension keybindings mirroring the Neovim leader-key mappings.
- **`.config/pycodestyle`** — Python style: 88-char lines (Black-compatible), ignores E203/W503.

## Conventions

- Python formatting uses Black (line length 88) everywhere — Neovim LSP, VSCode, and pycodestyle are all aligned on this.
- Neovim keybindings use `<Space>` as leader; VSCode Vim bindings mirror these where possible.
- Machine-specific shell config goes in `~/.zshrc.local` or `~/.zsh_aliases`, not in the tracked dotfiles.
