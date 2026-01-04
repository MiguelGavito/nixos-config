
{
  imports = [
    ./ide/nvim
    ./programs
    ./shell
    ./desktop/base  # Common desktop configurations
    
    # Desktop-specific imports are now controlled by modules
    # Enable them in outputs/x86_64-linux/src/elnavio.nix
  ];
}

