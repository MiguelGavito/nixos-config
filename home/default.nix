{ lib, ... }:
{
  imports = [
    # Cross-platform base configuration
    ./base
    
    # Platform-specific configurations - conditionally imported based on OS
  ] ++ (
    if (lib.strings.hasSuffix "darwin" (builtins.currentSystem or ""))
    then [ ./darwin ]
    else [ ./linux ]
  );
}
