{ ... }:

{ 
  programs = {
    git = {
      enable = true;

      extraConfig = {
        advice = {
          skippedCherryPicks = false;
        };

       fetch = {
          prune = true;
          pruneTags = true;
        };

        init = {
          defaultBranch = "main";
        };

        push = {
          autoSetupRemote = true;
        };

        user = {
          name = "Armin Jöllenbeck";
          email = "armin@joellenbeck.net";
        };
      };
    };
    
    gh = {
      enable = true;

      gitCredentialHelper.enable = true;
    };

    lazygit = {
      enable = true;
    };
  };
}
