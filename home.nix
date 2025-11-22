{ config, pkgs, ... }:

{
  imports = [ 
    ./programs
  ];
  home.username = "valenyala";
  home.homeDirectory = "/home/valenyala";
  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;

}
