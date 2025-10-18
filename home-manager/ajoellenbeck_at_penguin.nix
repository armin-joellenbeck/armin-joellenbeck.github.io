{ ... }:

{
  home = {
    stateVersion = "24.11";
    #username = "armin";
    username = "ajoellenbeck";
    #homeDirectory = "/home/armin";
    homeDirectory = "/home/ajoellenbeck";
  };

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;

    dates = [
      "daily"
    ];

    options = "--delete-older-than 7d";
  };
  
  imports = [
    ./bash.nix
    ./git.nix
    ./helix.nix
    ./micro.nix
    ./rust.nix
    ./ssh.nix
    ./tldr.nix
    ./tree.nix
  ];
}
