final: prev:  let 
  url = "https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v2.0.0&fileName=CHITUBOX_V2.0.0.tar.gz";
  sha256 = "07kgnpyh44r7lizgc7flj0cnpz26jl0x3sbnqrjfl95xfswrp985";
in 
  prev.stdenv.mkDerivation rec
  {
    pname = "LycheeSlicer";
    version = "5.4.3";
    src = prev.fetchurl {
      inherit url;
      inherit sha256;
    };

    unpackPhase = "dpkg-deb -x $src .";

    nativeBuildInputs = with prev; [
      dpkg
      autoPatchelfHook
      libgcc
      libstdcxx5
      zlib
      libGL
      libsForQt5.qt5.qtbase

      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxshmfence

      cairo
      libdrm
      mesa
      alsa-lib
      cups
      gdk-pixbuf
      gtk3
      pango
      icu58
      nspr
      nss
      dbus

      # wrapGAppsHook
      # qt6.wrapQtAppsHook
    ];
    dontWrapQtApps = true;

    installPhase = ''
      mkdir -p $out/bin
      cp -r ./* $out
      # cp -r usr/share $out/share

      # we already using QT6, autopatchelf wants to patch this as well
      # rm $out/usr/lib/x86_64-linux-gnu/opera/libqt5_shim.so
      # ln -s $out/usr/bin/opera $out/bin/opera
    '';
  }
