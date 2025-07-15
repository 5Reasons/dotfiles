# Dotfiles

My personal collection of dotfiles for macOS and Linux development environment setup.

## Overview

This repository contains configuration files and setup scripts to quickly configure a new development environment with:

- **Zsh** configuration with Oh My Zsh
- **Bash** profile configuration
- **Development tools** configuration (curl, wget, git, editor)
- Automated installation and synchronization scripts
- **Container-friendly** setup for Kubernetes/Docker environments

## Files

### Configuration Files

- **`.zshrc`** - Zsh shell configuration with Oh My Zsh integration
  - Theme: `robbyrussell`
  - Case-sensitive completion enabled
  - Enhanced PATH configuration with `~/bin` directory and early pyenv initialization
  - Plugins: bun, deno, direnv, git, gh, celery, man, colorize, node, npm, nvm, yarn, pip, python, pyenv, pipenv, poetry, ssh-agent, colored-man-pages, postgres, pyenv, ubuntu, uv, vscode
  - System-level syntax highlighting and autosuggestions integration
  - Bun runtime support with automatic PATH configuration
  - Pyenv integration with PYENV_ROOT configuration and shell-specific initialization

- **`.bash_profile`** - Bash shell configuration
  - PATH configuration with `~/bin` directory
  - Auto-loading of additional dotfiles (`.path`, `.bash_prompt`, `.exports`, `.aliases`, `.functions`, `.extra`)
  - Bash completion and SSH hostname completion
  - Case-insensitive globbing and history settings

- **`.curlrc`** - Curl configuration for secure downloads
- **`.wgetrc`** - Wget configuration for secure downloads
- **`.editorconfig`** - Consistent editor settings across different editors
- **`.gitignore`** - Git ignore patterns for the repository

### Installation Scripts

- **`bootstrap.sh`** - Main setup script that:
  - Pulls latest changes from the repository
  - Syncs dotfiles to home directory using rsync (with container-friendly options)
  - Creates and secures `.ssh` directory if needed
  - Installs or updates Oh My Zsh automatically
  - Changes default shell to zsh (with graceful fallback)
  - Excludes unnecessary files during sync
  - Works in both local and containerized environments

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
3. **SSH setup**: Create and secure `.ssh` directory with proper permissions (700)
4. **Oh My Zsh setup**:
   - Install Oh My Zsh if not present
   - Update existing installation if already installed
   - Preserve existing `.zshrc` configuration
5. **Shell configuration**: Attempt to change default shell to zsh (with graceful error handling)

## Features

### Zsh Configuration

- **Oh My Zsh** framework with robbyrussell theme
- **Enhanced plugins** for modern development workflow (JavaScript/TypeScript, Python, DevOps)
- **System-level integration** for syntax highlighting and autosuggestions
- **Runtime support** for Node.js, Python, Bun, Deno
- **Development tools** integration (VS Code, GitHub CLI, direnv)
- **Case-sensitive completion** for precise matching

### Bash Configuration

- **Modular design** with support for additional dotfiles
- **Enhanced completion** including SSH hostnames
- **Smart globbing** and history management
- **Development-friendly PATH** configuration

### Safety Features

- **Confirmation prompt** before overwriting files (unless `--force` flag is used)
- **Exclusion list** to prevent syncing unwanted files
- **Container-aware** rsync options (no permissions/timestamps for mounted volumes)
- **Graceful error handling** for restricted environments
- **SSH directory security** with proper permissions

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
plugins=(bun deno direnv git gh celery man colorize node npm nvm yarn pip python pyenv pipenv poetry ssh-agent colored-man-pages postgres pyenv ubuntu uv vscode)
```

### Development Runtime Support

The configuration includes support for:

- **JavaScript/TypeScript**: Node.js (nvm), Bun, Deno
- **Python**: pyenv with optimized configuration and early initialization, pipenv, poetry, uv (fast Python package installer)
  - PYENV_ROOT environment variable properly configured
  - Shell-specific initialization for zsh (`pyenv init - zsh`)
  - Early pyenv PATH configuration during shell startup
  - Virtualenv integration and initialization
  - Support for multiple Python versions
  - Optimized initialization order for faster shell startup
- **Database**: PostgreSQL tools and utilities
- **DevOps**: direnv for directory-based environment variables
- **Version Control**: Git with GitHub CLI (gh) integration
- **Editor**: VS Code integration and utilities

## Container/Kubernetes Usage

This dotfiles setup is optimized for containerized environments:

### Kubernetes/Coder Environment

```bash
# The script automatically detects CODER environment
# and skips interactive prompts
git clone https://github.com/5Reasons/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh  # No prompts in CODER environment
```

### Docker Containers

```bash
# Force installation without prompts
./bootstrap.sh --force
```

### Container-Specific Features

- **No timestamp conflicts**: Uses `--no-times` flag for mounted volumes
- **Permission handling**: Skips permission changes that fail in containers
- **SSH directory**: Creates secure SSH directory automatically
- **Graceful degradation**: Continues setup even if privileged operations fail

## Requirements

- **macOS or Linux** (primary target platforms)
- **Git** for cloning and updates
- **Curl** for Oh My Zsh installation (handled automatically by bootstrap script)
- **Zsh** shell (recommended)
- **Sudo access** (optional, for shell change - will gracefully skip if unavailable)

## Notes

- The installation preserves existing `.zshrc` files when installing Oh My Zsh
- Files are synced with `rsync` using container-friendly options
- The setup is designed to be idempotent - safe to run multiple times
- **Container support**: Works in Kubernetes pods and Docker containers with mounted volumes
- **SSH security**: Automatically creates and secures SSH directory with proper permissions
- **Error resilience**: Continues operation even if some steps fail (e.g., shell change in restricted environments)

## License

This project is open source and available under standard terms.
