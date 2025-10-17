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

  programs.bash.initExtra = ". /home/ajoellenbeck/.nix-profile/etc/profile.d/nix.sh";

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
