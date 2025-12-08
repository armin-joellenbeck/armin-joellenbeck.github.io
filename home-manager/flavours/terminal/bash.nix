{ ... }:

{ 
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto --group-directories-first -v";
      l = "ls -A";
      ll = "l -l";
      tree = "tree --dirsfirst -v";
      tt = "tree -a";
      t = "tt -I .git --gitignore";
    };
  };
}
