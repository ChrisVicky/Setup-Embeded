#!/bin/bash
PWD=$(pwd)
source ${PWD}/setup-zsh.sh
source ${PWD}/setup-binary.sh
source ${PWD}/setup-vim.sh
source ${PWD}/log.sh

install_basic() {
  info "Install Basic Dev Tools"
  info "sudo apt-get install zsh wget curl git -y"
  sudo apt-get install \
    zsh wget curl git \
    neofetch \
    -y
}

install_basic || (error "INSTALL BASIC ERROR" && exit 1) &&
  setup_binary || (error "INSTALL BINARY ERROR" && exit 1) &&
  setup_zsh || (error "INSTALL ZSH ERROR" && exit 1) &&
  setup_vim || (error "INSTALL VIM ERROR" && exit 1) &&
  info "====================" &&
  info "Install Complete!"
