{ ... }:

{
  home = {
    stateVersion = "24.11";
    username = "armin";
    homeDirectory = "/home/armin";
  };

  nix.settings = {
    extra-experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  imports = [
    ./features
  ];
}
