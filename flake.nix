{
    description = "Neovim Nix Config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
        nixvim.url = "github:nix-community/nixvim";
    };

    outputs = { self, nixpkgs, nixvim, ... }: let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

        nixvimModule = nixvim.legacyPackages.${system}.makeNixvim {
            imports = [
                ./default.nix
            ];
        };

        okularScript = import ./scripts/okular_nvr.nix { inherit pkgs; };

    in {
        packages.${system} = {
            default = nixvimModule;
            okular_nvr = okularScript;
        };
    };
}
