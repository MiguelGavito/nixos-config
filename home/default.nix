{
  imports = [
    ./cliPrograms/git.nix
    ./cliPrograms/ssh.nix
    ./cliPrograms/nvim
    ./cliPrograms/shell.nix
    ./cliPrograms/file-utils.nix
    ./cliPrograms/monitoring.nix
    ./cliPrograms/networking.nix
    ./cliPrograms/term-defaults.nix

    ./guiPrograms/blender.nix
    ./guiPrograms/discord.nix
    ./guiPrograms/brave.nix
    ./guiPrograms/libreoffice.nix
    ./guiPrograms/media.nix
    ./guiPrograms/audio.nix
    ./guiPrograms/social.nix
    ./guiPrograms/firefox.nix
    ./guiPrograms/dolphin.nix
    ./guiPrograms/vscode.nix
    ./guiPrograms/kde-apps.nix
    ./guiPrograms/wofi.nix
    ./guiPrograms/kitty.nix

    ./gaming/bottles.nix
    ./gaming/lutris.nix
    ./gaming/heroic.nix
    ./gaming/mods/deadlockModManager.nix   
    ./gaming/steam.nix

    ./desktop/hyprland.nix
    ./desktop/niri.nix
    ./desktop/autostart.nix

    ./sync/nextcloud.nix
    ./sync/onedrive.nix

    ./devTools/cpp.nix
    ./devTools/virtualization.nix
    ];
}
