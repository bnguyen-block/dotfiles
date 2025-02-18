<<<<<<< HEAD

{
  pkgs,
  gitDetails,
  ...
}: {
  enable = true;

  settings = {
    user = {
      name = gitDetails.username;
      email = gitDetails.email;
    };
    
    ui = {
      color = "auto"; # "always", "never", or "auto"
      default-command = "log"; # Default command if none is specified
      pager = "delta";
      diff = {
        tool = "delta"; # Specify diff tool ("git", "delta", etc.)
        format = "git";
      };
||||||| parent of f6fefad (nix: Add jj config and use jj from home-manager)
=======
{
  pkgs,
  gitDetails,
  ...
}: {
  enable = true;

  settings = {
    user = {
      name = gitDetails.username;
      email = gitDetails.email;
    };
    ui = {
      color = "auto"; # "always", "never", or "auto"
      default-command = "log"; # Default command if none is specified
      diff.tool = "delta"; # Specify diff tool ("git", "delta", etc.)
>>>>>>> f6fefad (nix: Add jj config and use jj from home-manager)
    };
  };
}
