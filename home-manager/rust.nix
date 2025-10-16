{ pkgs, ... }:

{
  home.packages = [
    pkgs.clang
    pkgs.lldb

    pkgs.cargo
    pkgs.clippy
    pkgs.rustc
    pkgs.rustfmt
    pkgs.rust-analyzer

    pkgs.bacon
  ];
}
