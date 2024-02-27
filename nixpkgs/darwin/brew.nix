{ inputs, config, pkgs, ... }:
let
  tapBlock = import ./tapBlock.nix { };
  brewBlock = import ./brewBlock.nix { };
in {
  environment = { };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    global = {
      brewfile = true;
      lockfiles = true;
    };

    taps = [
      "beeftornado/rmtree"
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/services"
    ] ++ tapBlock;

    brews = [
      "automake"
      "bash-completion@2"
      "cmake"
      "coreutils"
      "gettext"
      "libtermkey"
      "libtool"
      "libusb"
      "libuv"
      "libxmlsec1"
      "libyaml"
      "llvm@12"
      "luajit-openresty"
      "mas"
      "msgpack"
      "ninja"
      "pam-reattach"
      "pkg-config"
      "ruby-build"
      "starship"
      "tree-sitter"
      "zlib"
      "zstd"
    ] ++ brewBlock;

    casks = [
      "basictex"
      "clipy"
      "font-hack-nerd-font"
      "hammerspoon"
      "intellij-idea-ce"
      "obsidian"
      "postman"
      "visual-studio-code"
    ];
  };
}
