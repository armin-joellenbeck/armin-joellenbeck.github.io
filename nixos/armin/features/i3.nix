{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    package = pkgs.i3-gaps;

    config = {
      modifier = "Mod4";

      gaps = {
        inner = 10;
        outer = 5;
      };

      terminal = "ghostty --gtk-single-instance=true";

      startup = [
        { command = "ghostty --gtk-single-instance=true"; }
        { command = "xsetroot -solid \"#555555\""; }
      ];

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

      modes = {
        "[e]xit, [s]uspend, [r]eboot, [p]oweroff" = {
          "e" = "exec i3-msg exit";
          "s" = "exec systemctl suspend";
          "r" = "exec systemctl reboot";
          "p" = "exec systemctl poweroff";
          "Escape" = "mode \"default\"";
        };
      };

      keybindings = lib.mkOptionDefault {
        "Ctrl+Mod1+Delete" =
          "mode \"[e]xit, [s]uspend, [r]eboot, [p]oweroff\"";
        "Shift+Mod4+Return" =
          "exec google-chrome-stable";
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
