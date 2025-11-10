final: prev: {
  awesome-git = (import ./awesome-git.nix) final prev;
  cursor-appimage = (import ./cursor.nix) final prev;
  # lychee-slicer = (import ./lychee-slicer.nix) final prev;
}
