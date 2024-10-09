ZSHRC=$(pwd)/.zshrc

install_oh_my_zsh_wget() {
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

install_oh_my_zsh_curl() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# with oh-my-zsh
install_zsh_plugins() {
  # zsh-autosuggestions
  info "Install zsh-autosuggestions"
  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] ||
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # zsh-syntax-highlighting
  info "Install zsh-syntax-highlighting"
  [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] ||
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # zsh-completions
  info "Install zsh-completions"
  [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions ] ||
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

  # powerlevel10k
  info "Install powerlevel10k"
  [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] ||
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

setup_zsh() {
  ([ -d ~/.oh-my-zsh ] && info "OH-My-ZSH already installed") ||
    (
      install_oh_my_zsh_curl || install_oh_my_zsh_wget || (error "INSTALL OH-My-ZSH with wget ERROR" && exit 1) &&
        [ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak && cp ${ZSHRC} ~/.zshrc
    ) &&
    install_zsh_plugins || (error "INSTALL zsh Plugins ERROR" && exit 1)
}
