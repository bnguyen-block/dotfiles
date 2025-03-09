{
  inputs,
  config,
  pkgs,
  ...
}: let
  tapBlock = import ./tapBlock.nix {};
  brewBlock = import ./brewBlock.nix {};
in {
  environment = {};

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

    taps =
      [
        "beeftornado/rmtree"
        "homebrew/bundle"
        "homebrew/cask-fonts"
        "homebrew/cask-versions"
        "homebrew/services"
      ]
      ++ tapBlock;

    brews =
      [
        "automake"
        "bash-completion@2"
        "cmake"
        "colordiff"
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
        "luv"
        "mas"
        "msgpack"
        "ninja"
        "pam-reattach"
        "pcre2"
        "pkg-config"
        "ruby-build"
        "starship"
        "terminal-notifier"
        "tree-sitter"
        "zlib"
        "zstd"
      ]
      ++ brewBlock;

    casks = [
      "chatgpt"
      "clipy"
      "font-hack-nerd-font"
      "hammerspoon"
      "intellij-idea-ce"
      "obsidian"
      "postman"
      "visual-studio-code"
      "google-cloud-sdk"
    ];
  };
}
