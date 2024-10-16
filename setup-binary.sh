BINDIR=${HOME}/.local/bin/
TMP=${PWD}/.tmp
WD=$(pwd)
ARCH=$(uname -m)

pre_setup_binary() {
  [ -d ${BINDIR} ] ||
    mkdir ${BINDIR}

  [ -d ${TMP} ] && rm -rf ${TMP}
  mkdir ${TMP}
}

install_lazygit() {
  info "Install lazygit"
  cd ${TMP}
  case ${ARCH} in
  aarch64)
    pkg="lazygit_0.44.1_Linux_arm64.tar.gz"
    ;;
  *)
    pkg="lazygit_0.44.1_Linux_32-bit.tar.gz"
    ;;
  esac
  [ -f ${BINDIR}/lazygit ] ||
    (
      wget https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/${pkg} &&
        tar -xvf ${pkg} &&
        mv lazygit ${BINDIR}
    )
}

install_lazydocker() {
  info "Install lazydocker"
  cd ${TMP}
  case ${ARCH} in
  aarch64)
    pkg="lazydocker_0.23.3_Linux_arm64.tar.gz"
    ;;
  *)
    pkg="lazydocker_0.23.3_Linux_x86_64.tar.gz"
    ;;
  esac
  [ -f ${BINDIR}/lazydocker ] ||
    (
      wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/${pkg} &&
        tar -xvf ${pkg} &&
        mv lazydocker ${BINDIR}
    )
}

install_zellij() {
  info "Install zellij"
  cd ${TMP}
  case ${ARCH} in
  aarch64)
    pkg="zellij-aarch64-unknown-linux-musl.tar.gz"
    ;;
  *)
    pkg="zellij-x86_64-unknown-linux-musl.tar.gz"
    ;;
  esac
  [ -f ${BINDIR}/zellij ] ||
    (
      wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/${pkg} &&
        tar -xvf ${pkg} &&
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
