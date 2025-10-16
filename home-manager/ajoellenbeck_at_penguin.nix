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
