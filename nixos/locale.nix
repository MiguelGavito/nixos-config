{ config, lib, ... }:

{  
  # Set your time zone.
  time.timeZone = lib.mkDefault "UTC";

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
}
