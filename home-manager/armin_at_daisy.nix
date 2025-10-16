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
    ./alacritty.nix
    ./bash.nix
    ./git.nix
    ./google-chrome.nix
    ./helix.nix
    ./i3.nix
    ./micro.nix
    ./rust.nix
    ./ssh.nix
    ./tldr.nix
    ./tree.nix
  ];
}
