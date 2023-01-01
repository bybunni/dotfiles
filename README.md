# neovim
## Installation
https://github.com/neovim/neovim/wiki/Installing-Neovim

## Configuration
### Copy configuration to home directory
`cp -R dotfiles/.config/nvim/ ~/.config/`

### Launch `nvim`, Packer will auto install, then install remaining plugins with Packer
```
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
:PackerSync

-- Show list of installed plugins
:PackerStatus

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
```

### Mason to install LSP
```
:Mason -- install desired LSP by selecting and pressing `i`, e.g. python-lsp-server
```

### LSP Configuration
```
-- Mason should install black by default, but if not install with:
:PylspInstall python-lsp-black
```

### Python Provider
```bash
# necessary for developing Python remote plugins `rplugin`
python -m pip install pynvim

# the following is likely unnecessary and should be handled by Mason
python -m pip install python-lsp-server
python -m pip install python-lsp-black 
```

