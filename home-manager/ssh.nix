{ pkgs, ... }:

{
  home.packages = [
    pkgs.mosh
  ];

  programs.ssh = {
    enable = true;

    package = pkgs.openssh;

    enableDefaultConfig = false;
  };
}
