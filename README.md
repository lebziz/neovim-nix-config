# Nixvim Configuration ❄️

A modular, declarative Neovim configuration built using [Nixvim](https://github.com/nix-community/nixvim).

This repository is a translation of a traditional Lua-based setup into the Nix ecosystem. A fully declarative configuration that includes plugins for LaTeX, Python, Typst and more.

## Installation

### Install on any Linux Distro with Nix
nix run github:lebziz/neovim-nix-config

### Install via Home Manager (NixOS)
Add this repository to your flake inputs and install the packages:
inputs.my-nixvim.url = "github:lebziz/neovim-nix-config";

# In your home.nix:
home.packages = [
    inputs.my-nixvim.packages.${pkgs.system}.default
    inputs.my-nixvim.packages.${pkgs.system}.okular-nvr
];

## Acknowledgements
