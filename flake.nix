{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }: {
    nixosModules.opendrop.imports = [
      ./services/opendrop-server.nix
      ({ pkgs, ... }: {
        services.opendrop-server = {
          ## provide packages from flake
          package = self.packages.${pkgs.system}.opendrop;
          owlPackage = self.packages.${pkgs.system}.owl;
        };
      })
    ];
  } // flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in  {
    packages = {
      owl = pkgs.callPackage ./owl/default.nix { };
      opendrop = pkgs.callPackage ./opendrop/default.nix { };
    };
  });
}
    
