{ pkgs, ... }:

{
  home.packages = [
    pkgs.mosh
  ];

  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;
  };
}
