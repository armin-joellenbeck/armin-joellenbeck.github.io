{ ... }:

{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "github_light";

      editor = {
        auto-save = {
          focus-lost = true;
          after-delay = {
            enable = true;
            timeout = 3000;
          };
        };

        # end-of-line-diagnostics = "hint";
          
        inline-diagnostics = {
          cursor-line = "hint";
        };
      };
    };
  };
}
