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
- `init.lua` - Main entry point, contains core Neovim settings and plugin bootstrap
- `lua/custom/` - Personal customizations
  - `keymaps.lua` - Custom key mappings
  - `options.lua` - Neovim options
  - `plugins/` - Additional plugin configurations (codecompanion, codeium, harpoon, oil, etc.)
- `lua/kickstart/` - Original kickstart modules
  - `plugins/` - Kickstart plugin configurations (debug, linting, etc.)

### Plugin System
Uses `lazy.nvim` as the plugin manager. Key plugins include:
- LSP: `nvim-lspconfig` with Mason for automatic server installation
- Completion: `nvim-cmp` with various sources
- AI Assistance: CodeCompanion and Codeium
- File Management: Oil.nvim, Neo-tree
- Git: vim-fugitive, gitsigns, vim-rhubarb
- Debugging: nvim-dap with language-specific adapters (Python, Go, Ruby)

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