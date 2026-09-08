{
    description = "Neovim Nix Config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        nixvim.url = "github:nix-community/nixvim";
    };

    outputs = { self, nixpkgs, nixvim, ... }: let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        nixvimModule = nixvim.legacyPackages.x86_64-linux.makeNixvim {
            imports = [
                ./default.nix
            ];
        };

        okularScript = import ./scripts/okular_nvr.nix { inherit pkgs; };

    in {
        packages.x86_64-linux = {
            default = nixvimModule;
            okular_nvr = okularScript;
        };
    };
}
