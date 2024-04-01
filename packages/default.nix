{pkgs, ...}:
let 
  awesome = import ./awesome.nix {inherit pkgs;};
in {
  inherit awesome;
}
