{ inputs, system ? "x86_64-linux" }:

let
  pkgs = import inputs.nixpkgs { inherit system; };
in
pkgs.mkShell {
  packages = with pkgs; [
    jdk
    maven
  ];

  env.JAVA_HOME = "${pkgs.jdk}/lib/openjdk";

}
