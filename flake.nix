{
  description = "Factify Python SDK - Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ {
    flake-parts,
    systems,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;

      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Speakeasy CLI
            speakeasy-cli

            # Python tooling
            uv
            python312

            # Version control
            git
            gh

            # Utilities
            jq
          ];

          shellHook = ''
            echo "🐍 Factify Python SDK Development Environment"
            echo "Speakeasy: $(speakeasy --version 2>&1 | head -n1)"
            echo "Python: $(python --version)"
            echo "uv: $(uv --version)"
          '';
        };
      };
    };
}
