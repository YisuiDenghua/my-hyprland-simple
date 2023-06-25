#flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {nixpkgs, home-manager, hyprland, ...}: 
    let system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."yisui@legion-y9000x"= home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          hyprland.homeManagerModules.default
          ./hyprland

      ];
    };
  };
}

