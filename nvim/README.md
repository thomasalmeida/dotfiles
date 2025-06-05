# Neovim Configuration

## Table of Contents

- [Installed Plugins](#installed-plugins)
- [Keybindings by Plugin](#keybindings-by-plugin)
  - [Core Keybindings](#core-keybindings)
  - [oil.nvim](#oilnvim)
  - [snacks.nvim](#snacksnvim)
  - [todo-comments.nvim](#todo-commentsnvim)
  - [mini.nvim](#mininvim)
  - [auto-session](#auto-session)
  - [telescope.nvim](#telescopenvim)
  - [undotree](#undotree)
  - [harpoon](#harpoon)
  - [vim-maximizer](#vim-maximizer)
  - [vim-fugitive](#vim-fugitive)
  - [gitsigns.nvim](#gitsignsnvim)
  - [lazygit.nvim](#lazygitnvim)
  - [nvim-lspconfig](#nvim-lspconfig)
  - [nvim-lint](#nvim-lint)
  - [trouble.nvim](#troublenvim)
  - [nvim-emmet](#nvim-emmet)
  - [nvim-ufo](#nvim-ufo)
  - [nvim-dap](#nvim-dap)
  - [conform.nvim](#conformnvim)

## Installed Plugins

- **nvim-autopairs**: Automatically pairs brackets, quotes, etc.
- **oil.nvim**: A modern file explorer for Neovim.
- **snacks.nvim**: A collection of utilities including Lazygit integration, file renaming, and more.
- **todo-comments.nvim**: Highlights and manages TODO comments in code.
- **mini.nvim**: A suite of small plugins including comment, surround, trailspace, and splitjoin.
- **auto-session**: Automatically saves and restores Neovim sessions.
- **telescope.nvim**: A highly extensible fuzzy finder over lists.
- **undotree**: Visualizes the undo history and makes it easy to navigate.
- **plenary.nvim**: A library of Lua functions used by other plugins.
- **harpoon**: Allows quick navigation between marked files.
- **nvim-treesitter**: Provides better syntax highlighting and code parsing.
- **nvim-ts-autotag**: Automatically closes HTML tags.
- **lualine.nvim**: A fast and configurable statusline for Neovim.
- **wilder.nvim**: Enhances command-line completion with a popup menu.
- **vim-maximizer**: Maximizes and restores the current window.
- **vim-fugitive**: A comprehensive Git wrapper for Neovim.
- **gitsigns.nvim**: Shows Git signs in the gutter and provides Git-related utilities.
- **lazygit.nvim**: Integrates LazyGit for a terminal-based Git interface.
- **nvim-cmp**: A completion engine for Neovim.
- **mason.nvim**: Manages LSP servers, linters, and formatters.
- **nvim-lspconfig**: Configures LSP servers for Neovim.
- **noice.nvim**: Enhances the Neovim UI with notifications and more.
- **nvim-lint**: Provides linting capabilities.
- **trouble.nvim**: Displays diagnostics, references, and more in a list.
- **nvim-emmet**: Provides Emmet support for faster HTML/CSS coding.
- **render-markdown.nvim**: Renders Markdown files with improved visuals.
- **nvim-ufo**: Enhances code folding in Neovim.
- **nvim-tree.lua** (disabled): A file explorer tree for Neovim.
- **nvim-surround** (disabled): Adds commands to surround text with characters.
- **which-key.nvim** (disabled): Displays available keybindings in a popup.
- **nvim-dap**: A debug adapter protocol client for Neovim.
- **conform.nvim**: A formatting plugin for Neovim.
- **lazydev.nvim**: Tools for developing LazyVim plugins.

## Keybindings by Plugin

### Core Keybindings

- **Visual Mode:**
  - `J`: Move selected lines down
  - `K`: Move selected lines up
- **Normal Mode:**
  - `<C-d>`: Scroll down with cursor centered
  - `<C-u>`: Scroll up with cursor centered
  - `<leader>p`: Paste without yanking
  - `<leader>Y`: Yank to system clipboard
  - `<leader>d`: Delete without yanking
  - `<C-c>`: Clear search highlight
  - `<leader>f`: Format with LSP
  - `<C-f>`: Start new tmux session
  - `<leader>s`: Replace word under cursor globally
  - **Tab Management:**
    - `<leader>to`: Open new tab
    - `<leader>tx`: Close current tab
    - `<leader>tn`: Go to next tab
    - `<leader>tp`: Go to previous tab
    - `<leader>tf`: Open current buffer in new tab
  - **Split Management:**
    - `<leader>sv`: Split window vertically
    - `<leader>sh`: Split window horizontally
    - `<leader>se`: Make splits equal size
    - `<leader>sx`: Close current split
  - `<leader>fp`: Copy file path to clipboard
  - `<leader>lx`: Toggle LSP diagnostics

### oil.nvim

- `-`: Open parent directory
- `<leader>-`: Open parent directory in floating window

### snacks.nvim

- `<leader>lg`: Open Lazygit
- `<leader>gl`: Open Lazygit logs
- `<leader>rN`: Fast rename current file
- `<leader>dB`: Delete or close buffer
- `<leader>pf`: Find files
- `<leader>pc`: Find config file
- `<leader>ps`: Grep word
- `<leader>pws`: Search visual selection or word (normal and visual modes)
- `<leader>pk`: Search keymaps
- `<leader>gbr`: Pick and switch Git branches
- `<leader>th`: Pick color schemes
- `<leader>vh`: Help pages
- `<leader>pt`: Todo comments
- `<leader>pT`: Todo/Fix/Fixme comments

### todo-comments.nvim

- `]t`: Next todo comment
- `[t`: Previous todo comment

### mini.nvim

- **mini.surround:**
  - `sa`: Add surrounding
  - `ds`: Delete surrounding
  - `sf`: Find surrounding (right)
  - `sF`: Find surrounding (left)
  - `sh`: Highlight surrounding
  - `sr`: Replace surrounding
  - `sn`: Update n_lines
- **mini.trailspace:**
  - `<leader>cw`: Erase whitespace
- **mini.splitjoin:**
  - `sj`: Join arguments
  - `sk`: Split arguments

### auto-session

- `<leader>wr`: Restore session for current working directory
- `<leader>ws`: Save session for auto session root directory

### telescope.nvim

- `<leader>pr`: Fuzzy find recent files
- `<leader>pWs`: Find connected words under cursor
- `<leader>ths`: Theme switcher

### undotree

- `<leader>u`: Toggle Undotree

### harpoon

- `<leader>a`: Add file to Harpoon
- `<C-e>`: Toggle Harpoon quick menu
- `<C-y>`, `<C-i>`, `<C-n>`, `<C-s>`: Select specific Harpoon marks
- `<C-S-P>`: Previous Harpoon buffer
- `<C-S-N>`: Next Harpoon buffer

### vim-maximizer

- `<leader>sm`: Maximize/minimize a split

### vim-fugitive

- `<leader>gg`: Open Git status
- `<leader>P`: Git push
- `<leader>p`: Git pull --rebase
- `<leader>t`: Git push -u origin

### gitsigns.nvim

- `]h`: Next hunk
- `[h`: Previous hunk
- `<leader>gs`: Stage hunk
- `<leader>gr`: Reset hunk
- `<leader>gS`: Stage buffer
- `<leader>gR`: Reset buffer
- `<leader>gu`: Undo stage hunk
- `<leader>gp`: Preview hunk
- `<leader>gbl`: Blame line
- `<leader>gB`: Toggle line blame
- `<leader>gd`: Diff this
- `<leader>gD`: Diff this ~

### lazygit.nvim

- `<leader>lg`: Open LazyGit

### nvim-lspconfig

- `gR`: Show LSP references
- `gD`: Go to declaration
- `gd`: Show LSP definitions
- `gi`: Show LSP implementations
- `gt`: Show LSP type definitions
- `<leader>vca`: Code actions (normal and visual modes)
- `<leader>rn`: Rename
- `<leader>D`: Show buffer diagnostics
- `<leader>d`: Show line diagnostics
- `K`: Show documentation
- `<leader>rs`: Restart LSP
- `<C-h>` (insert mode): Signature help

### nvim-lint

- `<leader>l`: Trigger linting

### trouble.nvim

- `<leader>xw`: Open trouble workspace diagnostics
- `<leader>xd`: Open trouble document diagnostics
- `<leader>xq`: Open trouble quickfix list
- `<leader>xl`: Open trouble location list
- `<leader>xt`: Open todos in trouble

### nvim-emmet

- `<leader>xe`: Wrap with Emmet abbreviation (normal and visual modes)

### nvim-ufo

- `zR`: Open all folds
- `zM`: Close all folds

### nvim-dap

- `<Leader>db`: Toggle breakpoint
- `<Leader>dc`: Continue

### conform.nvim

- `<leader>mp`: Format with Prettier (normal and visual modes)
