let
  block = builtins.readFile ./block.sh;
  functions = builtins.readFile ./functions.sh;
  git = builtins.readFile ./git.sh;
  keybindings = builtins.readFile ./keybindings.sh;
  zshrc = builtins.readFile ./zshrc.sh;
  prompt = builtins.readFile ./prompt.sh;
  mise = builtins.readFile ./mise.sh;
in block + functions + git + keybindings + prompt + zshrc + mise
