{ pkgs, lib, config, ... }:{
  home.packages = with pkgs; [
    gamescope #unstable on nvidia
    alacritty #terminal
    brightnessctl #This program allows you read and control device brightness
    wf-recorder #screen record
    # eww #status bar
    swaybg #desktop background for wayland
    xdg-desktop-portal-hyprland
    waybar #status bar
    hyprland-protocols
    grim #screenshot
    slurp #also
    rofi #launcher
    thunar #file manager
  ];
    
    wayland.windowManager.hyprland = {
      extraConfig = builtins.readFile ./hyprland.conf;
      enable = true;
      xwayland = {
        enable = true;
        hidpi = true;
      };
      systemdIntegration = true;
      nvidiaPatches = true; # If you don't use Nvidia card, remove it.
      
      
    };
    
#   };
  
}
