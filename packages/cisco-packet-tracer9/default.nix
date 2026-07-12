{
  lib,
  stdenvNoCC,
  dpkg,
  appimageTools,
  makeWrapper,
  qt6Packages,
}:

let
  appimage = stdenvNoCC.mkDerivation {
    pname = "packettracer-appimage";
    version = "9.0.0";

    src = ../CiscoPacketTracer_900_Ubuntu_64bit.deb;

    nativeBuildInputs = [
      dpkg
    ];

    unpackPhase = ''
      dpkg-deb -x $src .
    '';

    installPhase = ''
      mkdir -p $out
      cp opt/pt/packettracer.AppImage $out/
    '';
  };

in
appimageTools.wrapType2 {
  pname = "cisco-packet-tracer9";
  version = "9.0.0";

  src = "${appimage}/packettracer.AppImage";

  nativeBuildInputs = [
    makeWrapper
  ];

  extraPkgs = pkgs: with pkgs; [
    stdenv.cc.cc.lib

    # OpenGL
    libglvnd
    mesa

    # Qt/XCB
    qt6Packages.qtbase
    qt6Packages.qtwayland

    # X11
    libx11
    libxext
    libxrender
    libxi
    libxcb
    libxcomposite
    libxdamage
    libxfixes
    libxrandr
    libxtst
    libxkbcommon
    libxkbfile

    # Qt WebEngine / Chromium
    nss
    nspr
    dbus

    # Fonts
    fontconfig
    freetype
    harfbuzz
    libpng
    zlib
    expat

    # Audio
    alsa-lib
    libpulseaudio
  ];

  extraInstallCommands = ''
    wrapProgram $out/bin/cisco-packet-tracer9 \
      --set QT_QPA_PLATFORM xcb \
      --set QT_PLUGIN_PATH ${qt6Packages.qtbase}/lib/qt-6/plugins
  '';
}
