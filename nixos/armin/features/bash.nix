{ ... }:

{ 
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -al";
      ls = "ls --color=auto --group-directories-first -v";
    };
  };
}
