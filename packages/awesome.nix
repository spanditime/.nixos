{pkgs, ...}:  let 
  rev = "3a542219f3bf129546ae79eb20e384ea28fa9798";
  sha256 = "4z3w6iuv+Gw2xRvhv2AX4suO6dl82woJn0p1nkEx3uM=";
in 
pkgs.awesome.overrideAttrs (oa: 
  {
    version = rev;
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      inherit rev;
      inherit sha256;
    };
    patches = [];
    postPatch = ''
      patchShebangs test/examples/_postprocess.lua
    '';
  }
)
