{ pkgs, ... }:

{
  home.packages = [
    pkgs.mosh
  ];

  programs.ssh = {
    enable = true;

    package = pkgs.openssh;

    enableDefaultConfig = false;
    
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };
  };
}
