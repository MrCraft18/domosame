{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        kwja.url = "github:MrCraft18/kwja-flake";
    };

    outputs = { nixpkgs, ... } @inputs:
        let
            forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
        in {
            devShells = forAllSystems (system: 
                let
                    pkgs = import nixpkgs { inherit system; };
                in {
                    default = pkgs.mkShell {
                        packages = with pkgs; [
                            nodejs
                        ] ++ [
                            inputs.kwja.packages.${system}.default 
                        ];

                        shellHook = ''
                            export NPM_CONFIG_PREFIX="HOME/.npm"
                        '';
                    };
                }
            );
    };
}
