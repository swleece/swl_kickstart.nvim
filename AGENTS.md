# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim, customized with personal settings and additional plugins. The configuration is designed to be launched with the `kv` command through the NVIM_APPNAME mechanism.

## Key Commands

### Health Check
```bash
nvim +checkhealth
```
Verifies Neovim version (requires 0.12+ for `vim.pack`), checks for required executables (git, make, unzip, rg).

### Launch
```bash
kv  # Uses NVIM_APPNAME to launch this specific config
```

### Plugin Management
Uses `vim.pack`, Neovim's built-in plugin manager (no third-party bootstrap).
- `:lua vim.pack.update()` - Update all plugins
- `:lua vim.pack.update(nil, { offline = true })` - Inspect plugin state / pending updates without fetching
- Plugins are added imperatively with `vim.pack.add { 'https://github.com/owner/repo' }` followed by the plugin's `.setup()` call.
- Reproducible versions are tracked in `nvim-pack-lock.json` (see `:help vim.pack-lockfile`).

### Core Keybindings
- Leader key: `<space>`
- `<leader>pv` or `<leader>ex` - Open file explorer (netrw)
- `<leader>yc` - Yank to system clipboard (visual mode)
- `<leader>cp` - Copy to clipboard (visual mode)
- `<C-a>` - CodeCompanion actions
- `<leader>sG` - Search by grep on Git root

## Architecture

### Directory Structure
- `init.lua` - Main entry point. Kept **byte-identical to upstream** except for a small,
  clearly-marked set of loader lines (see Reconciliation Strategy).
- `lua/custom/` - Personal customizations (isolated from upstream)
  - `init.lua` - Custom init module; `require('custom').setup()` loads options + keymaps
  - `keymaps.lua` - Custom key mappings (also defines the `LiveGrepGitRoot` command)
  - `options.lua` - Neovim option overrides/additions + `setup_codecompanion()`
  - `plugins/` - Additional plugins, each an imperative `vim.pack` module
    (codecompanion, codeium, harpoon, oil, diffview, tidal, neotree, lsp, dap-extra, ...)
- `lua/kickstart/` - Original kickstart modules (synced with upstream)
  - `plugins/` - Kickstart plugin configurations (debug, lint, autopairs, neo-tree, gitsigns)

### Plugin System
Uses `vim.pack` (built into Neovim 0.12+) as the plugin manager. Key plugins include:
- LSP: `nvim-lspconfig` with Mason for automatic server installation (pyright enabled via `lua/custom/plugins/lsp.lua`)
- Completion: `blink.cmp` (aligned with upstream kickstart.nvim)
- Icons: `mini.icons` (mocks `nvim-web-devicons` for compatibility)
- File Management: Oil.nvim, Neo-tree
- Git: vim-fugitive, gitsigns, vim-rhubarb, diffview
- Debugging: nvim-dap with language-specific adapters (Python, Go, Ruby) + virtual text

### Upstream Compatibility and Reconciliation Strategy
The core invariant: **`init.lua` and `lua/kickstart/**` stay identical to upstream.** All
customization lives in `lua/custom/`. The only permitted edits to `init.lua` are a handful of
loader lines at upstream-stable extension points:
1. `require('custom').setup()` right after SECTION 2 (loads custom options + keymaps so they
   override upstream defaults).
2. Uncommenting the optional `require 'kickstart.plugins.*'` we use (debug, lint, autopairs, gitsigns).
3. Uncommenting `require 'custom.plugins'` (loads every `lua/custom/plugins/*.lua`).

Everything else — colorscheme (catppuccin), pyright, DAP extras, treesitter languages — is a
`custom/` file, **never** an inline init.lua edit. Custom plugin files are plain imperative Lua
(`vim.pack.add` + `.setup()`), loaded last, so they can safely override or extend upstream.

### Future Merges
Because the merge-base is now current and init.lua/kickstart are unmodified, syncing is a
normal merge:
1. `git fetch upstream && git merge upstream/master`
2. For any conflict in `init.lua` or `lua/kickstart/**`, take upstream ("theirs") and, if a
   sanctioned loader line moved, re-apply it.
3. `lua/custom/**` should not conflict (upstream never touches it).
4. Run `nvim +checkhealth` and launch to test, then update this doc with any new divergences.

### Python Debugging Setup
Requires a virtual environment with debugpy:
```bash
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

## Development Notes

- This config tracks `nvim-pack-lock.json` for reproducible plugin versions (`:help vim.pack-lockfile`)
- Uses `guess-indent.nvim` for automatic indentation detection (upstream default)
- Uses `vim-commentary` for code commenting (`gc`/`gcc`); mini.comment is intentionally not used
- Configured for various languages through Mason LSP installer
