# This is not useful unless you are using NixOS https://nixos.org/

# GLFW fix for IntelliJ on NixOS 24.11 with nix-shell.
# To execute type: nix-shell

{ pkgs ? import <nixpkgs> {} }:

  pkgs.mkShell {
    buildInputs = [
      pkgs.libGL
    ];

  shellHook = ''
    export LD_LIBRARY_PATH="''${LD_LIBRARY_PATH}''${LD_LIBRARY_PATH:+:}${pkgs.libglvnd}/lib"
    idea-community ./ &
  '';
}
