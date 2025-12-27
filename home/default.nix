{
  imports = [
    ./cliPrograms/git.nix
    ./cliPrograms/ssh.nix
    ./cliPrograms/nvim
    ./cliPrograms/shell.nix
    ./cliPrograms/file-utils.nix
    ./cliPrograms/monitoring.nix
    ./cliPrograms/networking.nix
    
    ./guiPrograms/blender.nix
    ./guiPrograms/discord.nix
    ./guiPrograms/brave.nix
    ./guiPrograms/libreoffice.nix
    ./guiPrograms/media.nix
    ./guiPrograms/audio.nix
    ./guiPrograms/social.nix
    ./guiPrograms/firefox.nix
    ./guiPrograms/vscode.nix
    ./guiPrograms/kde-apps.nix
    ./guiPrograms/wofi.nix
    ./guiPrograms/kitty.nix

    ./gaming/bottles.nix
    ./gaming/lutris.nix
    ./gaming/heroic.nix
    # ./gaming/steam.nix
    ./gaming/mods/deadlockModManager.nix   

    ./sync/nextcloud.nix
    ./sync/onedrive.nix

    ./devTools/cpp.nix
    ./devTools/virtualization.nix
    ];
}
