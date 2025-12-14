{ config, pkgs, ... }:

{
  # Zona horaria
  time.timeZone = "America/Monterrey";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Locales adicionales (descomenta si necesitas)
  # i18n.extraLocaleSettings = {
  #   LC_TIME = "es_MX.UTF-8";
  #   LC_MONETARY = "es_MX.UTF-8";
  #   LC_MEASUREMENT = "es_MX.UTF-8";
  # };
}
