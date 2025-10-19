{ ... }:

{ 
  programs = {
    git = {
      enable = true;

      extraConfig = {
        advice = {
          skippedCherryPicks = false;
        };

        commit ={
          verbose = true;
        };

        diff = {
          colorMoved = "plain";
          mnemonicPrefix = true;
          renames = "true";
        };
          
        fetch = {
          all = true;
          prune = true;
          pruneTags = true;
        };

        init = {
          defaultBranch = "main";
        };

        merge = {
          ff = "only";
        };

        push = {
          followTags = true;
          pushDefault = "nothing";
        };

        rebase = {
          abbreviateCommands = true;
          autoSquash = true;
          missingCommitsCheck = "error";
          updateRefs = true;
        };

        rerere = {
          enabled = true;
          autoupdate = true;
        };
          
        tag = {
          sort = "version:refname";  
        };
        
        user = {
          name = "Armin Jöllenbeck";
          email = "armin@joellenbeck.net";
        };
      };
    };

    lazygit = {
      enable = true;
    };
  };
}
