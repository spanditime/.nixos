final: prev:  let 
  extraGIPackages = with prev; [ networkmanager upower playerctl ];
  rev = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
  sha256 = "sha256-ZGZ53IWfQfNU8q/hKexFpb/2mJyqtK5M9t9HrXoEJCg=";
in 
(prev.awesome.override {gtk3Support = true;}).overrideAttrs (old: 
  {
    version = rev;
    src = prev.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      inherit rev;
      inherit sha256;
    };
    patches = [];
    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
      patchShebangs tests/examples/_postprocess_cleanup.lua
    '';
    cmakeFlags = old.cmakeFlags ++ [ "-DGENERATE_MANPAGES=OFF" ];
    GI_TYPELIB_PATH =
      let
        mkTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
        extraGITypeLibPaths = prev.lib.forEach extraGIPackages mkTypeLibPath;
      in
      prev.lib.concatStringsSep ":" (extraGITypeLibPaths ++ [ (mkTypeLibPath prev.pango.out) ]);
  }
)
