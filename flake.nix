{

    description = "Cyborg C's Flake";

    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-26.05";
	};
	home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
	};
    };

    outputs = { self, nixpkgs, home-manager, ... }:
      let
        lib = nixpkgs.lib;
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
      in {
          nixosConfigurations = {
              NixCyborgC = lib.nixosSystem {
                inherit system;
		modules = [ ./configuration.nix ];
	      };
	  };
	  homeConfigurations = {
		cyborgc = home-manager.lib.homeManagerConfiguration {
		  inherit pkgs;
	  	  modules = [ ./home.nix ];
	      };

	  };
    };
}
