# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim, customized with personal settings and additional plugins. The configuration is designed to be launched with the `kv` command through the NVIM_APPNAME mechanism.

## Key Commands

### Health Check
```bash
nvim +checkhealth
```
Verifies Neovim version (requires 0.10+), checks for required executables (git, make, unzip, rg).

### Launch
```bash
kv  # Uses NVIM_APPNAME to launch this specific config
```

### Plugin Management
- `:Lazy` - Opens the Lazy plugin manager UI
- `:Lazy sync` - Update all plugins
- `:Lazy health` - Check plugin health

### Core Keybindings
- Leader key: `<space>`
- `<leader>pv` or `<leader>ex` - Open file explorer (netrw)
- `<leader>yc` - Yank to system clipboard (visual mode)
- `<leader>cp` - Copy to clipboard (visual mode)
- `<C-a>` - CodeCompanion actions
- `<leader>sG` - Search by grep on Git root

## Architecture

### Directory Structure
- `init.lua` - Main entry point, streamlined to load modules and bootstrap lazy.nvim
- `lua/custom/` - Personal customizations (isolated from upstream)
  - `init.lua` - Custom initialization module
  - `keymaps.lua` - Custom key mappings
  - `options.lua` - Neovim options
  - `overrides.lua` - Plugin overrides for upstream compatibility
  - `plugins/` - Additional plugin configurations (codecompanion, codeium, harpoon, oil, etc.)
- `lua/kickstart/` - Original kickstart modules (synced with upstream)
  - `plugins/` - Kickstart plugin configurations (debug, linting, autopairs, neo-tree, gitsigns)

### Plugin System
Uses `lazy.nvim` as the plugin manager. Key plugins include:
- LSP: `nvim-lspconfig` with Mason for automatic server installation
- Completion: `blink.cmp` (aligned with upstream kickstart.nvim)
- File Management: Oil.nvim, Neo-tree
- Git: vim-fugitive, gitsigns, vim-rhubarb
- Debugging: nvim-dap with language-specific adapters (Python, Go, Ruby)

### Upstream Compatibility and Reconciliation Strategy
This configuration maintains compatibility with upstream kickstart.nvim through careful separation:
- **Custom code isolation**: All personal customizations live in `lua/custom/`
- **Additional Plugins**: Custom plugins in `lua/custom/plugins/` not present in upstream
- **Key Mappings**: Personal keybindings preserved in `lua/custom/keymaps.lua`
- **Options**: Custom Neovim options in `lua/custom/options.lua`
- **Modular overrides**: The `lua/custom/overrides.lua` file handles plugin-specific customizations when needed
- **Upstream sync**: The `lua/kickstart/` directory stays aligned with upstream changes
- **Clean init.lua**: The main init file is kept minimal and closely aligned with upstream, delegating custom logic to modules

### Future Merges
When merging future upstream changes:
1. Pull upstream changes into a separate branch
2. Review changes to `init.lua` and adapt them in `lua/custom/` modules if needed
3. Accept updates to `lua/kickstart/` directory
4. Test thoroughly before merging to main branch
5. Update this documentation with any new divergences

### Python Debugging Setup
Requires a virtual environment with debugpy:
```bash
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

## Development Notes

- This config tracks `lazy-lock.json` for reproducible plugin versions
- Uses vim-sleuth for automatic indentation detection
- Includes both commentary.vim and mini.comment for code commenting
- Configured for various languages through Mason LSP installer
