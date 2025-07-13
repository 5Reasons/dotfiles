#!/usr/bin/env bash
set -o errtrace

cd "$(dirname "${BASH_SOURCE}")"

git pull origin main

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude "LICENSE-MIT.txt" \
        -avh --no-perms --no-times . ~
    source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" -o "$CODER" == "true" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt

cd ${HOME}

[[ -d .ssh ]] || $(mkdir -p .ssh && chmod 700 .ssh)

if [[ -d .oh-my-zsh ]]; then
    echo "Updating Oh My Zsh..."
    cd .oh-my-zsh
    git pull origin master
    cd ${HOME}
else
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh) "$(whoami)" || echo "Note: Could not change default shell!"
