{ pkgs, lib, ... }:

{
  xsession = {
    enable = true;
  
    windowManager.i3 = {
      enable = true;

      package = pkgs.i3-gaps;

      config = {
        modifier = "Mod4";

        gaps = {
          inner = 5;
          outer = 0;
        };

        bars = [
          {
            fonts = {
              names = ["pango"];
              style = "monospace";
              size = 16.0;
            };

            statusCommand = "i3status";
          }
        ];

        startup = [
          { command = "xsetroot -solid \"#555555\""; }
          { command = "alacritty"; }
          { command = "google-chrome-stable"; }
        ];

        terminal = "alacritty msg create-window || alacritty";

        keybindings = lib.mkOptionDefault {
          "Ctrl+Mod1+Delete" = "exec pkill chrome; exec sleep 1; exec i3-msg exit";
          "Shift+Mod4+Return" = "exec google-chrome-stable";
        };
      };
    };
  };

  programs.i3status = {
    enable = true;

    enableDefault = false;

    modules = {
      "tztime local" = {
        enable = true;

        settings = {
          format = "%H:%M";
        };
      };
    };
  };
}
