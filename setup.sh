source ./setup-zsh.sh
source ./setup-binary.sh

install_basic() {
  echo "Install Basic Dev Tools"
  echo "sudo apt-get install zsh wget curl git -y"
  sudo apt-get install zsh wget curl git -y
}

install_basic || echo "INSTALL BASIC ERROR" && exit 1
setup_binray || echo "INSTALL BINARY ERROR" && exit 1
setup_zsh() || echo "INSTALL ZSH ERROR" && exit 1
