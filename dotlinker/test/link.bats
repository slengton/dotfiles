#!./test/libs/bats/bin/bats

load 'helpers'

link="./link"

setup() {
  setupEnvironment
}

teardown() {
  teardownEnvironment
}

@test "Creates symbolic links for supplied files/directories when they don't exist" {
  run touch $DOTLINKER_SOURCE/vimrc
  run touch $DOTLINKER_SOURCE/tmux.conf
  run mkdir $DOTLINKER_SOURCE/tmux

  run $link vimrc tmux tmux.conf

  assert_success
  assert_link_exists "$DOTLINKER_TARGET/.vimrc"
  assert_line_ouput_link_created "$DOTLINKER_SOURCE/vimrc" "$DOTLINKER_TARGET/.vimrc"
  assert_link_exists "$DOTLINKER_TARGET/.tmux.conf"
  assert_line_ouput_link_created "$DOTLINKER_SOURCE/tmux.conf" "$DOTLINKER_TARGET/.tmux.conf"
  assert_link_exists "$DOTLINKER_TARGET/.tmux"
  assert_line_ouput_link_created "$DOTLINKER_SOURCE/tmux" "$DOTLINKER_TARGET/.tmux"
}

@test "Does not create a symbolic link for a supplied file if it already exists" {
  run touch $DOTLINKER_SOURCE/vimrc
  run touch $DOTLINKER_SOURCE/zshrc
  run mkdir $DOTLINKER_SOURCE/tmux
  run ln -s $DOTLINKER_SOURCE/tmux $DOTLINKER_TARGET/.tmux

  run $link vimrc zshrc tmux

  assert_success
  assert_line_ouput_link_exists "$DOTLINKER_SOURCE/tmux" "$DOTLINKER_TARGET/.tmux"
}

@test "Errors out when a symbolic link for a supplied file already exists to a different path" {
  run touch $DOTLINKER_SOURCE/vimrc
  run touch $DOTLINKER_SOURCE/zshrc
  run mkdir $DOTLINKER_SOURCE/tmux
  run mkdir $DOTLINKER_SOURCE/other
  run ln -s $DOTLINKER_SOURCE/other $DOTLINKER_TARGET/.tmux

  run $link vimrc zshrc tmux

  assert_failure
  assert_line_ouput_link_error "$DOTLINKER_SOURCE/tmux" "$DOTLINKER_TARGET/.tmux"
}
