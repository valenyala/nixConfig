{
  programs.zsh = {
    enable = true;

    initContent = builtins.readFile ./.zshrc;
    shellAliases = {
       # fzf history
      hf = "history 0 | awk '{$1=\"\"; print substr($0,2)}' | awk '!seen[$0]++' | fzf";
      
      # bat (cat replacement)
      nlcat = "bat --theme=\"Solarized (dark)\" --style plain";
      cat = "bat --theme=\"Solarized (dark)\"";
      
      # eza (ls replacement)
      la = "eza -la";
      lst = "eza -l -snew";
      ls = "eza -l";
      lat = "eza -la -snew";
      
      # zoxide
      cd = "z";
      
      # kde
      explorer = "nautilus";
      
      # nvim
      viconf = "nvim ~/.config/nvim";
      nvimconf = "nvim ~/.config/nvim";
      vi = "nvim";
      
      # lazygit
      lg = "lazygit";
      
      # pnpm
      npm = "pnpm";
      
      # zsh config
      vialias = "nvim ~/.alias";
      viAlias = "nvim ~/.alias";
      srcalias = "source ~/.alias";
      srcAlias = "source ~/.alias";
      vizsh = "nvim ~/.zshrc";
      viZsh = "nvim ~/.zshrc";
      srczsh = "source ~/.zshrc";
      srcZsh = "source ~/.zshrc";
      
      # libreoffice
      lowrite = "libreoffice --writer";
      
      # scripts
      ibusR = "ibus start --type=wayland";
      wb = "nohup waybar > /dev/null &";
      obs = "nixglhost obs";
      
      # openvpn
      ovpn = "sudo openvpn ~/Downloads/academy-regular.ovpn";

      # nix home-manager switch
      hms = "home-manager switch --flake ~/.config/nix";
    };
  };
}
