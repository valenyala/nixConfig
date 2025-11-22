# z
# export PATH="/home/valenyala/.local/bin:$PATH"
# nvim
# export PATH="/opt/nvim/bin:$PATH"
# go
# export PATH="/usr/local/go/bin:$PATH"
# miktex
# export PATH="/home/valenyala/bin:$PATH"
# as-cmd - export pipewire audio to local network
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
export PATH="/opt/audio-share-server-cmd/bin:$PATH"
export EDITOR="nvim"

# source ~/.config/nix/programs/shell/.alias

setopt AUTOCD

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt hist_ignore_all_dups
setopt hist_save_no_dups

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source /usr/share/nvm/init-nvm.sh

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export PYTHONWARNINGS="ignore::Warning"








# mkdir and cd
mkdirAndCd() { mkdir -p "$1" && cd "$1"; }
alias mkcd='mkdirAndCd'

# rm alias with confirmation
rmAlias() {
  # Check if no arguments provided
  if [ $# -eq 0 ]; then
    echo "Usage: rmAlias <file/directory> [file/directory ...]"
    return 1
  fi
  
  # Loop through each argument
  for item in "$@"; do
    # Check if the item exists
    if [ ! -e "$item" ]; then
      echo "Error: '$item' does not exist."
      continue
    fi
    
    # Handle directories
    if [ -d "$item" ]; then
      echo "Are you sure you want to delete the directory '$item'? (y/n): "
      read confirm
      if [ "$confirm" = "y" ]; then
        \rm -r "$item"
        echo "Directory '$item' deleted."
      else
        echo "Deletion of '$item' cancelled."
      fi
    # Handle files
    else
      echo "Are you sure you want to delete the file '$item'? (y/n): "
      read confirm
      if [ "$confirm" = "y" ]; then
        \rm "$item"
        echo "File '$item' deleted."
      else
        echo "Deletion of '$item' cancelled."
      fi
    fi
  done
}
alias rm='rmAlias'

# Mix video and audio with ffmpeg
mixVideoAndAudio() {
  if [ $# -eq 0 ]; then
    echo "Usage: mix <prefix>"
    return 1
  fi
  videoFile="$1".mp4
  audioFile="$1"a.mp4
  blendedFile="$1"-blended.mp4
  
  # Check if files exist
  if [ ! -f "$videoFile" ]; then
    echo "Error: Video file '$videoFile' not found!"
    return 1
  fi
  if [ ! -f "$audioFile" ]; then
    echo "Error: Audio file '$audioFile' not found!"
    return 1
  fi
  
  # Mix video and audio using ffmpeg
  ffmpeg -i "$videoFile" -i "$audioFile" -c:v copy -c:a aac -shortest "$blendedFile"
}
alias mix='mixVideoAndAudio'

# RDP connection
connectToRDP() {
  xfreerdp3 /u:htb-student /p:Academy_WinFun! /v:$1
}
alias rdp='connectToRDP'

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
alias y='y'
