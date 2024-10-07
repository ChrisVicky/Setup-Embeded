BINDIR=${HOME}/.local/bin
TMP=${HOME}/.tmp

pre_setup_binary() {
  mkdir ${BINDIR}
  mkdir ${TMP}
}

install_lazygit() {
  echo "Install lazygit"
  cd ${TMP}
  [ -f ${BINDIR}/lazygit ] ||
    wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Linux_arm64.tar.gz &&
    tar -xvf lazygit_0.44.1_Linux_arm64.tar.gz &&
    mv lazygit ${BINDIR}
}

install_lazydocker() {
  echo "Install lazydocker"
  cd ${TMP}
  [ -f ${BINDIR}/lazydocker ] ||
    wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_arm64.tar.gz &&
    tar -xvf lazydocker_0.23.3_Linux_arm64.tar.gz &&
    mv lazydocker ${BINDIR}
}

install_zellij() {
  echo "Install zellij"
  cd ${TMP}
  [ -f ${BINDIR}/zellij ] ||
    wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-aarch64-unknown-linux-musl.tar.gz &&
    tar -xvf zellij-aarch64-unknown-linux-musl.tar.gz &&
    mv zellij ${BINDIR}
}

post_setup_binary() {
  rm -rf ${TMP}
}
setup_binary() {
  pre_setup_binary || (echo "PRE-SETUP ERROR" && exit 1) &&
    install_lazygit || (echo "INSTALL lazygit ERROR" && exit 1) &&
    install_lazydocker || (echo "INSTALL lazydocker ERROR" && exit 1) &&
    install_zellij || (echo "INSTALL zellij ERROR" && exit 1) &&
    post_setup_binary || (echo "POST-SETUP ERROR" && exit 1)
}
