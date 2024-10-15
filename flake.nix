{
  description = "RXcept NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs =
    { nixpkgs, nixvim, flake-parts, pre-commit-hooks, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, self', lib, ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};
	  nvim = nixvim'.makeNixvimWithModule {
	    inherit pkgs;
	    module = ./config;
	  };
        in
        {
          checks = {
            default = pkgs.nixvimLib.check.mkTestDerivationFromNvim {
	      inherit nvim;
	      name = "My nixvim configuration";
	    };
	    pre-commit-check = pre-commit-hooks.lib.${system}.run {
	      src = ./.;
	      hooks = {
	        statix.enable = true;
		alejandra.enable = true;
	      };
	    };
          };

          formatter = pkgs.alejandra;

	  packages.default = nvim;

	  devShells = {
	    default = with pkgs;
	      mkShell {inherit (self'.checks.pre-commit-check) shellHooks;};
	  };
        };
    };
}
