{ ... }:

{
  home = {
    stateVersion = "24.11";
    username = "ajoellenbeck";
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
    ./terminal
  ];
}
