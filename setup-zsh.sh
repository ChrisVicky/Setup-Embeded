install_oh_my_zsh_wget() {
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

install_oh_my_zsh_curl() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# with oh-my-zsh
install_zsh_plugins() {
  # zsh-autosuggestions
  echo "Install zsh-autosuggestions"
  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] ||
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # zsh-syntax-highlighting
  echo "Install zsh-syntax-highlighting"
  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] ||
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # zsh-completions
  echo "Install zsh-completions"
  [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions] ||
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

  # powerlevel10k
  echo "Install powerlevel10k"
  [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] ||
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

setup_zsh() {
  install_oh_my_zsh_curl || install_oh_my_zsh_wget || (echo "INSTALL OH-My-ZSH with wget ERROR" && exit 1)

  cp $(pwd)/.zshrc ~/.zshrc

  install_zsh_plugins || (echo "INSTALL zsh Plugin ERROR" && exit 1)
}
