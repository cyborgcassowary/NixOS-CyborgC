{

    description = "Cyborg C's Flake";

    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-26.05";
	};
    };

    outputs = { self, nixpkgs, ... }:
      let
        lib = nixpkgs.lib;
      in {
          nixosConfigurations = {
              NixCyborgC = lib.nixosSystem {
                  system = "x86_64-linux";
	  	  modules = [ ./configuration.nix ];
	      };
	  };
    };
}
