#!/bin/bash

set -euo pipefail

PKGS=(
	git
	curl
	wget
	unzip
	btop
	zoxide
	build-essential
	bat
	fzf
	zsh
	zsh-syntax-highlighting
	zsh-autosuggestions
	ca-certificates
	apt-transport-https
	gpg
	eza
	golang
	stow
	libgtk-3-dev
	libwebkit2gtk-4.1-dev
	pkg-config
	nsis
	)

sudo apt update && sudo apt upgrade -y

sudo apt install "${PKGS[@]}" -y

curl -sS https://starship.rs/install.sh | sh -s -- -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list
sudo apt update
sudo apt install temurin-25-jdk -y

cd ~
mkdir github forgejo

cd "$HOME/wsldots"
stow zsh starship gitconfig git-profiles

sudo chsh -s "$(which zsh)" "$USER"

echo "Setup finished."