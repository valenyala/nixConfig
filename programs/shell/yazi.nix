{
  programs.yazi = {
    enable = true;
    
    settings = {
      opener = {
        play = [
          {
            run = ''vlc "$@"'';
            orphan = true;
            for = "unix";
          }
        ];
        edit = [
          {
            run = ''$EDITOR "$@"'';
            block = true;
            for = "unix";
          }
        ];
        open = [
          {
            run = ''xdg-open "$@"'';
            orphan = true;
            for = "unix";
          }
          {
            run = ''zathura -c ~/.config/zathura/zathurarc "$@"'';
            block = true;
            for = "unix";
          }
        ];
      };

      open = {
        rules = [
          { mime = "text/*"; use = "edit"; }
          { mime = "video/*"; use = "play"; }
          { mime = "application/json"; use = "edit"; }
          { mime = "application/pdf"; use = "open"; }
          { name = "*.html"; use = [ "open" "edit" ]; }
        ];
      };
    };
  };
}
