{ ... }:

{
  home = {
    stateVersion = "24.11";
    username = "armin";
    homeDirectory = "/home/armin";
  };

  programs.home-manager.enable = true;

  imports = [
    ../../flavours/graphical
    ../../flavours/terminal
    ../../flavours/xsession
  ];
}
