{
  description = "main server config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      mainserver = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/mainserver/configuration.nix ];
      };
      #newserver = nixpkgs.lib.nixosSystem {
      #  system = "x86_64-linux";
      #  modules = [ ./hosts/newserver.configuration.nix ];
      #};
    };
  };
}
