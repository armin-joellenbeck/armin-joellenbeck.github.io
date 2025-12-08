{ ... }:

{
  xsession = {
    enable = true;
  
    windowManager.i3.enable = true;
  };

  imports = [
    ./i3.nix
  ];
}
