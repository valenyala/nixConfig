{
  programs.zathura = {
    options = {
      # Highlight
      highlight-active-color = "#ffffff";
      highlight-transparency = 1;
      
      # Statusbar
      statusbar-basename = true;
      statusbar-page-percent = true;
      
      # Recolor (dark mode)
      recolor = true;
      recolor-lightcolor = "rgba(28, 28, 28, 0.8)";
      recolor-darkcolor = "#ebdbb2";
      
      # Background
      default-bg = "rgba(29, 32, 33, 0.8)";
      
      # Clipboard
      selection-clipboard = "clipboard";
      
      # SyncTeX
      synctex = true;
      synctex-editor-command = "nvr --remote-silent +%{line} %{input}";
    };
    enable = true;
  };
}
