{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.stylua
    pkgs.lua-language-server
  ];
}
