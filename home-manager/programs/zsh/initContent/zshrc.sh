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
# Multi-user installs (darwin) use nix-daemon.sh; single-user (linux) uses nix.sh
if [[ ! "$PATH" == *$HOME/.nix-profile/bin* ]]; then
  if [[ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  elif [[ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]]; then
    source "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
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
# claude code
################################################################################
# Prefer the self-updating native install in ~/.local/bin over the IT-managed
# copy in /usr/local/bin. Unconditional prepend: export_path would skip it
# because home.sessionPath already appends ~/.local/bin.
export PATH="$HOME/.local/bin:$PATH"

################################################################################
# block
################################################################################
export_path "$HOME/bin"
export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
export_path "/Applications/SnowSQL.app/Contents/MacOS"
