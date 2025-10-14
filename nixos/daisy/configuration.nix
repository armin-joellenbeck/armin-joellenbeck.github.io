{ config, pkgs, lib, ... }:

{
  imports = [
    <home-manager/nixos>
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  console.keyMap = "de-latin1-nodeadkeys";

  hardware = {
    bluetooth = {
      enable = true;
    };

    enableAllFirmware = true;

    enableAllHardware = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  home-manager = {
    backupFileExtension = "backup";

    useGlobalPkgs = true;

    users.armin = { pkgs, ... }: {
      imports = [
        ../armin/home.nix
      ];
    };    
  };

  networking = {
    firewall.enable = false;
    hostName = "daisy";
    networkmanager.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense = true;
  };

  security.rtkit.enable = true;

  services = {
    blueman.enable = true;

    displayManager.ly = {
      enable = true;

      settings = {
        brightness_down_key = "null";
        brightness_up_key = "null";
      };
    };
    
    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      jack.enable = true;

      pulse.enable = true;
    };
    
    pulseaudio.enable = false;

    openssh = {
      enable = true;

      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    xserver = {
      enable = true;

      videoDrivers = ["nouveau"];

      xkb = {
        layout = "de";
        variant = "nodeadkeys";
      };
    };
  };

  system.stateVersion = "24.11";

  time.timeZone = "Europe/Berlin";

  users.users.armin = {
    description = "Armin Jöllenbeck";

    isNormalUser = true;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHlILC65uB97qxhZqACejWvnsEO6AlsZu89vm6VUYMH JuiceSSH"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBTdSe1DZgngDhURVbDbnZ9DE96PWxIpSr8U745AGrj1 ajoellenbeck@penguin"
    ];
  };

}
