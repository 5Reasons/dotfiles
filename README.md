# Dotfiles

My personal collection of dotfiles for macOS development environment setup.

## Overview

This repository contains configuration files and setup scripts to quickly configure a new macOS development environment with:

- **Zsh** configuration with Oh My Zsh
- **Bash** profile configuration
- Automated installation and synchronization scripts

## Files

### Configuration Files

- **`.zshrc`** - Zsh shell configuration with Oh My Zsh integration
  - Theme: `robbyrussell`
  - Case-sensitive completion enabled
  - Plugins: git, celery, man, colorize, node, npm, yarn, pip, python, pyenv, pipenv, poetry, ssh-agent, colored-man-pages, zsh-autosuggestions, zsh-syntax-highlighting

- **`.bash_profile`** - Bash shell configuration
  - PATH configuration with `~/bin` directory
  - Auto-loading of additional dotfiles (`.path`, `.bash_prompt`, `.exports`, `.aliases`, `.functions`, `.extra`)
  - Bash completion and SSH hostname completion
  - Case-insensitive globbing and history settings

### Installation Scripts

- **`bootstrap.sh`** - Main setup script that:
  - Pulls latest changes from the repository
  - Syncs dotfiles to home directory using rsync
  - Installs or updates Oh My Zsh automatically
  - Excludes unnecessary files during sync

## Quick Start

### Option 1: Clone and Bootstrap

```bash
git clone https://github.com/5Reasons/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

### Option 2: Force Installation

```bash
cd ~/.dotfiles
./bootstrap.sh --force
```

## Installation Details

The bootstrap script will:

1. **Update repository**: Pull the latest changes from the main branch
2. **Sync files**: Copy dotfiles to your home directory (excluding `.git`, `.DS_Store`, and other unnecessary files)
3. **Oh My Zsh setup**:
   - Install Oh My Zsh if not present
   - Update existing installation if already installed
   - Preserve existing `.zshrc` configuration

## Features

### Zsh Configuration

- **Oh My Zsh** framework with robbyrussell theme
- **Enhanced plugins** for development workflow
- **Auto-suggestions** and syntax highlighting
- **Case-sensitive completion** for precise matching

### Bash Configuration

- **Modular design** with support for additional dotfiles
- **Enhanced completion** including SSH hostnames
- **Smart globbing** and history management
- **Development-friendly PATH** configuration

### Safety Features

- **Confirmation prompt** before overwriting files (unless `--force` flag is used)
- **Exclusion list** to prevent syncing unwanted files
- **Backup-friendly** rsync with proper flags

## Customization

### Adding Personal Configuration

Create additional files in your home directory:

- `~/.path` - Extend PATH variable
- `~/.extra` - Personal settings not to be committed
- `~/.aliases` - Custom aliases
- `~/.functions` - Custom shell functions
- `~/.exports` - Environment variables
- `~/.bash_prompt` - Custom bash prompt

### Modifying Zsh Plugins

Edit the `plugins` array in `.zshrc`:

```bash
plugins=(git celery man colorize node npm yarn pip python pyenv pipenv poetry ssh-agent colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
```

## Requirements

- **macOS** (primary target platform)
- **Git** for cloning and updates
- **Curl** for Oh My Zsh installation (handled automatically by bootstrap script)
- **Zsh** shell (recommended)

## Notes

- The installation preserves existing `.zshrc` files when installing Oh My Zsh
- Files are synced with `rsync` to maintain permissions and handle updates efficiently
- The setup is designed to be idempotent - safe to run multiple times

## License

This project is open source and available under standard terms.
