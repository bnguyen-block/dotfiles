let
  block = builtins.readFile ./block.sh;
  functions = builtins.readFile ./functions.sh;
  git = builtins.readFile ./git.sh;
  keybindings = builtins.readFile ./keybindings.sh;
  mise = builtins.readFile ./mise.sh;
  prompt = builtins.readFile ./prompt.sh;
  worktrunk = builtins.readFile ./worktrunk.sh;
  zshrc = builtins.readFile ./zshrc.sh;
in block + functions + git + keybindings + mise + prompt + zshrc + worktrunk
