BINDIR=${HOME}/.local/bin/
TMP=${PWD}/.tmp
WD=$(pwd)

pre_setup_binary() {
  [ -d ${BINDIR} ] ||
    mkdir ${BINDIR}

  [ -d ${TMP} ] && rm -rf ${TMP}
  mkdir ${TMP}
}

install_lazygit() {
  info "Install lazygit"
  cd ${TMP}
  [ -f ${BINDIR}/lazygit ] ||
    (
      wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Linux_arm64.tar.gz &&
        tar -xvf lazygit_0.44.1_Linux_arm64.tar.gz &&
        mv lazygit ${BINDIR}
    )
}

install_lazydocker() {
  info "Install lazydocker"
  cd ${TMP}
  [ -f ${BINDIR}/lazydocker ] ||
    (
      wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_arm64.tar.gz &&
        tar -xvf lazydocker_0.23.3_Linux_arm64.tar.gz &&
        mv lazydocker ${BINDIR}
    )
}

install_zellij() {
  info "Install zellij"
  cd ${TMP}
  [ -f ${BINDIR}/zellij ] ||
    (
      wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-aarch64-unknown-linux-musl.tar.gz &&
        tar -xvf zellij-aarch64-unknown-linux-musl.tar.gz &&
        mv zellij ${BINDIR}
    )
}

post_setup_binary() {
  rm -rf ${TMP}
  cd ${WD}
}
setup_binary() {
  pre_setup_binary || (error "PRE-SETUP ERROR" && exit 1) &&
    install_lazygit || (error "INSTALL lazygit ERROR" && exit 1) &&
    install_lazydocker || (error "INSTALL lazydocker ERROR" && exit 1) &&
    install_zellij || (error "INSTALL zellij ERROR" && exit 1) &&
    post_setup_binary || (error "POST-SETUP ERROR" && exit 1)
}
