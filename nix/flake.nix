{
  description = "my nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nvf = {
      url = "github:notashelf/nvf";
    };
  };

  outputs = { nixpkgs, ... } @inputs: {
    nixosConfigurations = {

      nixbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./config/main.nix ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./config/wsl.nix ];
      };

    };
  };
}
