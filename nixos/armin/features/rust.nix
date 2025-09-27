{ pkgs, ... }:

{
  home.packages = [
    pkgs.gcc
    pkgs.cargo
    pkgs.clippy
    pkgs.rustc
    pkgs.rustfmt
    pkgs.rust-analyzer
  ];
}
