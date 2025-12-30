{
  description = "Factify Python SDK - Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          # Speakeasy CLI
          speakeasy

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
    });
}
