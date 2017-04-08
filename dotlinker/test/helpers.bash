load 'libs/bats-support/load'
load 'libs/bats-assert/load'

setupEnvironment() {
  export DOTLINKER_SOURCE="$(mktemp -d)"
  export DOTLINKER_TARGET="$(mktemp -d)"
}

teardownEnvironment() {
  rm -r $DOTLINKER_SOURCE
  rm -r $DOTLINKER_TARGET
}

assert_link_exists() {
  assert [ -L "$1" ] && assert [ -e "$1" ]
}

assert_line_ouput_link_created() {
  assert_line "$(tput setaf 2)Link created $2 -> $1"
}

assert_line_ouput_link_exists() {
  assert_line "$(tput setaf 4)Link exists $2 -> $1"
}

assert_line_ouput_link_error() {
  assert_line "$(tput setaf 1)Link error $2 -> $1"
}
