# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Experimental Features
  nix.settings.experimental-features = ["flakes" "nix-command"];
 
  home-manager = {
	extraSpecialArgs = {inherit inputs;};
	users = {
	"dee" = import ./home.nix;
     };
  };

  networking.hostName = "Nix"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dee = {
    isNormalUser = true;
    description = "DeNix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    dunst
    vscode
    unzip
    kitty
    neovim
    brave
    waybar
    pyprland
    rofi-wayland
    hyprpaper
    vesktop
    neofetch
  ];

  fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono" "IBMPlexMono"];})
	inter
  ];
  fonts = {
    fontconfig = {
      defaultFonts = {
        monospace = [ "Fira Code" ];
        sansSerif = [ "Inter Display" ];
        serif     = [ "Inter Display"];
      };
    };
  };
  # List services that you want to enable:
  xdg.portal.enable = true;
  security.rtkit.enable = true;

  services = {
    printing.enable = true;
    displayManager.sddm.enable =  true;
    xserver = {
	enable = true;
	xkb.layout = "us";
	videoDrivers = ["nvidia" "amdgpu"];
    };
    pipewire = {
	enable =  true;
	pulse.enable = true;
    };
  };
  
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # OpenGL
  hardware = {
    # bluetooth.enable = true;
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  # Nvidia Settings - For Laptops
  hardware.nvidia.prime = {
    offload.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:5:0:0";
  };

  # Programs
  programs = {
    zsh.enable =  true;
    thunar.enable = true;
    hyprland = {
	enable = true;
	xwayland.enable =  true;
    };
  };
  users.defaultUserShell = pkgs.zsh;
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
}
