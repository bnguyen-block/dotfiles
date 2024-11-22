{pkgs, ...}:
with builtins; let
  commonPackages = import ./commonPackages.nix {inherit pkgs;};
  macosPackages = import ./macosPackages.nix {inherit pkgs;};
  linuxPackages = import ./linuxPackages.nix {inherit pkgs;};
  blockPackages = import ./blockPackages.nix {inherit pkgs;};
in
  commonPackages
  ++ (
    if pkgs.stdenv.hostPlatform.isLinux
    then linuxPackages
    else macosPackages
  )
  ++ blockPackages
