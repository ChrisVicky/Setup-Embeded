setup_vim() {
  [ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bak
  cp $(pwd)/.vimrc ~/.vimrc
}
