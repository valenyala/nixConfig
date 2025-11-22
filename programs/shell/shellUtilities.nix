{pkgs, ... }:
{
  home.packages = with pkgs; [
    eza
    neofetch
    bat
    zoxide
    starship
    zathura
    libreoffice
    yazi
    vlc
    lazygit
  ];
}
