{ pkgs ? import <nixpkgs> {} }:

let                              
  myPackage = pkgs.callPackage (pkgs.fetchFromGitHub {
      owner = "sethnine";        
      repo = "undock-nix";       
      rev = "e2f31dbde6f61b0d3b2e62818ab446defe4193f2";
      hash = "sha256-hzk1fe2LfOvjfCWoMcWeBW/NJUXxCLCDPivGVdJBs0c=";
    }) {};
in
pkgs.dockerTools.streamLayeredImage {
  name = "my-docker-image";
  tag = "latest";
  contents = [ myPackage pkgs.coreutils pkgs.bashInteractive];
  config.cmd = [ "${pkgs.bashInteractive}/bin/bash" ];
  # Add other configurations if needed
}


