{
  description = "my nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nvf = {
      url = "github:notashelf/nvf";
    };
  };

  outputs = { nixpkgs, ... } @inputs: 
    let
      system = "x86_64-linux";
    in {
    nixosConfigurations = {

      nixbox = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ ./config/main.nix ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ ./config/wsl.nix ];
      };
    };

    devShells.${system} = {

      python = import ./config/python.nix { inherit inputs system; };
    };
  };
}
