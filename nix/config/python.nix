{ inputs, system ? "x86_64-linux" }:

let
  pkgs = import inputs.nixpkgs { inherit system; };
in
pkgs.mkShell {
  packages = with pkgs; [
    python314Full
  ];

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.libz
  ];

}
