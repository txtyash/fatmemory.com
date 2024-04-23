{
  description = "Svelte devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        overlays = [];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [
            ];
            packages = [
              bashInteractive
              tailwindcss
              nodejs_21

              # LSPs
              nil
              marksman
              tailwindcss-language-server
              emmet-language-server
              # html, css, json
              vscode-langservers-extracted
              vscode-extensions.svelte.svelte-vscode
              nodePackages.eslint
              nodePackages.prettier
              nodePackages.svelte-language-server
              nodePackages.typescript-language-server

              # Formatters
              alejandra
            ];
            shellHook = ''
              # alias ls=eza
              # alias find=fd
            '';
          };
        }
    );
}
