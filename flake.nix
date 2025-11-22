{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gl-host.url = "github:numtide/nix-gl-host";
  };

  outputs = { nixpkgs, home-manager, nix-gl-host, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    in
  {
    homeConfigurations."valenyala" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ 
        {
        # Make nix-gl-host available in home.nix
          home.packages = [ nix-gl-host.packages.x86_64-linux.default ];
        }
        ./home.nix
      ];
    };
  };
}
