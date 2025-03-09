export_path() {
  if [[ ! "$PATH" == *"$1"* ]]; then
    export PATH="$1:${PATH}"
  fi
}

################################################################################
# Use nord for terminal color
################################################################################
if [[ uname == "Linux" ]]; then
  test "$HOME/dircolors.nord" && eval $(dircolors "$HOME/dircolors.nord")
fi

################################################################################
# nix
################################################################################
# Source nix package manager and fix perl locale warning
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

################################################################################
# homebrew
################################################################################
export_path "/opt/homebrew/bin"
export_path "/opt/homebrew/sbin"

################################################################################
# llvm
################################################################################
# export_path "/opt/homebrew/opt/llvm@12/bin"

################################################################################
# block
################################################################################
export_path "$HOME/bin"
export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
export_path "/Applications/SnowSQL.app/Contents/MacOS"
