{ pkgs ? import <nixpkgs> {}, lib ? pkgs.lib, fetchFromGitHub ? pkgs.fetchFromGitHub }:

let
  poetry2nix = import (fetchFromGitHub {
    owner = "nix-community";
    repo = "poetry2nix";
    rev = "e0b44e9e2d3aa855d1dd77b06f067cd0e0c3860d";
    sha256 = "sha256-puYyylgrBS4AFAHeyVRTjTUVD8DZdecJfymWJe7H438=";
  }) { inherit pkgs; };
  src = pkgs.fetchFromGitHub {
    owner = "sethnine";
    repo = "undock-compose";
    rev = "3f9e03e6c92b5ef39fce829d5f277fd6eea07477";
    hash = "sha256-EQ6b6lAujOIXnqwYHAaLcIt+9TExQqSnUp9f47atvgk=";
  };
in
  poetry2nix.mkPoetryApplication {
    projectDir = src;
    meta = with lib; {
  description = "Easily convert your unRAID Docker XML templates to Docker Compose YAML files.";
  longDescription = ''
A short script to move containers from the native unRAID templates to the more configurable Docker Compose specifications. The largest reason for motivation for doing so is to make use of multiple custom networks, something that is not readily available for the plain docker run command without a few wrappers.
  '';
  homepage = "https://github.com/arifer612/undock-compose/tree/master";
  license = licenses.gpl3Only;
  #maintainers = with maintainers; [ eelco ];
  platforms = platforms.all;
};

  }
