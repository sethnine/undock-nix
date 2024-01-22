{ pkgs ? import <nixpkgs> {} }:

let
  undock = pkgs.callPackage ./default.nix {};
in
pkgs.dockerTools.streamLayeredImage {
  name = "undock";
  tag = "latest";
  contents = [
    undock
    #pkgs.busybox
    pkgs.coreutils
    pkgs.bashInteractive
  ];
  config = {
    cmd = [ "${undock}/bin/undock-bulk" ];
    env = [
      "UNDOCK_INPUT=/in"
      "UNDOCK_OUTPUT=/out"
      "UNDOCK_FILTER=.*xml"
    ];
  };
  #created = "now";
  # Add other configurations if needed
}


