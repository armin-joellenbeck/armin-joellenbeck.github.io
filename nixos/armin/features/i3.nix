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
        { command = "ghostty --gtk-single-instance=true"; }
        { command = "exec google-chrome-stable"; }
      ];

      terminal = "ghostty --gtk-single-instance=true";

      keybindings = lib.mkOptionDefault {
        "Ctrl+Mod1+Delete" = "exec i3-msg exit";
        "Shift+Mod4+Return" = "exec google-chrome-stable";
      };

      workspaceOutputAssign = [
        { workspace = "1"; output = "HDMI-1"; }
        { workspace = "2"; output = "HDMI-1"; }
        { workspace = "3"; output = "HDMI-1"; }
        { workspace = "4"; output = "HDMI-1"; }
        { workspace = "5"; output = "HDMI-1"; }
        { workspace = "6"; output = "HDMI-1"; }
        { workspace = "7"; output = "HDMI-1"; }
        { workspace = "8"; output = "HDMI-1"; }
        { workspace = "9"; output = "VGA-1"; }
        { workspace = "10"; output = "VGA-1"; }
      ];

      # xsession.windowManager.i3.config.workspaceOutputAssign.*.output
      # xsession.windowManager.i3.config.workspaceOutputAssign.*.workspace
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
