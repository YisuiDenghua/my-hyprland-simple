# my-hyprland-simple

![image](https://github.com/YisuiDenghua/my-hyprland-simple/assets/102890144/0e1e52d7-2fcc-46f9-a4e3-fb58463194ec)


A simple configuration of Hyprland

Requirements： Nix, Home Manager with Flake enabled, Linux.

NixOS is not strongly required. 

Files here should be put into `~/hm/`, if you prefer somewhere else, you should change the directories in `flake.nix` and `hyprland/hyprland.conf` file.

Put the following things into your `flake.nix`.

Read the #comments in my files before you do!

Don't use my monitor configurations in `hyprland/hyprland.conf`, run `hyprctl monitors` to check your monitors. 

If you don't use nvidia, remove options about nvidia in my `hyprland/default.nix` and `hyprland/hyprland.conf`.

```
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

    let system = "x86_64-linux"; #This should change into your CPU architecture, if you are not sure, use "uname -mo" to check it.

    pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."yisui@legion-y9000x"= home-manager.lib.homeManagerConfiguration { #Change "yisui" to your user name, change "legion-y9000x" into your hostname. 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          hyprland.homeManagerModules.default
          ./hyprland #Path to the "hyprland" folder.

      ];
    };
  };
}
```
