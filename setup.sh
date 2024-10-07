#!/bin/bash
PWD=$(pwd)
source ${PWD}/setup-zsh.sh
source ${PWD}/setup-binary.sh
source ${PWD}/setup-vim.sh

install_basic() {
  echo "Install Basic Dev Tools"
  echo "sudo apt-get install zsh wget curl git -y"
  sudo apt-get install \
    zsh wget curl git \
    neofetch \
    -y
}

install_basic || (echo "INSTALL BASIC ERROR" && exit 1) &&
  setup_binary || (echo "INSTALL BINARY ERROR" && exit 1) &&
  setup_zsh || (echo "INSTALL ZSH ERROR" && exit 1) &&
  setup_vim || (echo "INSTALL VIM ERROR" && exit 1) &&
  echo "====================" &&
  echo "Install Complete!"
