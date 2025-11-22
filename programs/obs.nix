{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    
    # Enable CUDA support for NVENC hardware encoding
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
    
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
    ];
  };
}

