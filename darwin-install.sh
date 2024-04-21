#!/bin/sh

step () {
  echo "##########"
  echo "### Step: $1"
  echo "##########"
}

step "ssh-key"
ssh-keygen

step "copy ssh public key"
cat ~/.ssh/id_rsa.pub | pbcopy

echo "Your ssh-key copied to clipboard. Please, add it now to github"
read -p "Press enter to continue"

step "catppuccin theme"
git clone https://github.com/catppuccin/iterm.git ~/Downloads/iterm2

step "Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/max/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

step "iterm2"
brew install --cask iterm2

step "dotfiles repo"
git clone git@github.com:bazuka5801/dotfiles-macos.git
cd dotfiles-macos
# grant executable to all sh files
find . -name "*.sh" | xargs -I {} chmod +x {}

step "oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
git clone git@github.com:grigorii-zander/zsh-npm-scripts-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete
./link-dots.sh
source ~/.zshrc
step "pkg-config (for ffmpeg compile)"
brew install pkg-config
asdf install

step "xcodes"
brew install xcodesorg/made/xcodes
brew install aria2

step "xcode latest"
xcodes install --latest --experimental-unxip


function step_cask () {
	step "Installing cask: $1"
	brew install --cask $1
}

step_cask "visual-studio-code"
step_cask "audacity"
step_cask "github"

brew install sops age