{ config, ... }:

{ 
  programs = {
    git = {
      enable = true;

      extraConfig = {
        advice = {
          skippedCherryPicks = false;
        };

        commit ={
          gpgSign = true;
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

        gpg = {
          format = "ssh";
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
          signingkey = "/home/${config.home.username}/.ssh/id_ed25519";
        };
      };
    };

    lazygit = {
      enable = true;
    };
  };
}
