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
      upgrade = true;
      extraFlags = ["--force-cleanup"];
    };
    global = {
      brewfile = true;
    };

    taps =
      [
        {
          name = "beeftornado/rmtree";
          trusted = true;
        }
        "homebrew/bundle"
        "homebrew/services"
      ]
      ++ map (tap: tap // {trusted = true;}) tapBlock;

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
        "zlib"
        "zstd"
      ]
      ++ brewBlock;

    casks = [
      "chatgpt"
      "claude-code"
      "clipy"
      "codex"
      "font-hack-nerd-font"
      "gcloud-cli"
      "hammerspoon"
      "obsidian"
    ];
  };
}
