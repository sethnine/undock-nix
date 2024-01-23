{
  # https://youtu.be/WT75jfETWRg?si=vCmOldj7jC5RDGDD&t=82
  description = "hello docker flake";
  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = (import ./container.nix { inherit pkgs; });
    };
}
