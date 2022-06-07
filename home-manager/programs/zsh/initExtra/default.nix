let
  block = builtins.readFile ./block.sh;
  functions = builtins.readFile ./functions.sh;
  git = builtins.readFile ./git.sh;
  keybindings = builtins.readFile ./keybindings.sh;
  prompt = builtins.readFile ./prompt.sh;
  zshrc = builtins.readFile ./zshrc.sh;
in block + functions + git + keybindings + zshrc + prompt
