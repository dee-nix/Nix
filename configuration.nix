# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

      inputs.home-manager.nixosModules.default
    ];

  # Flakes 
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # boot.kernelParams = ["quiet" "radeon.modeset=0"];

  networking.hostName = "Nix"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
  # Hardware
  hardware.bluetooth.enable = true;
  hardware = {
	opengl.enable = true;
	nvidia.modesetting.enable = true;
  };

  # List services that you want to enable:
  xdg.portal.enable = true;
  services.xserver = {
	enable = true;
	videoDrivers = ["nvidia" "amdgpu"];
  };

  services.displayManager.sddm.enable =  true;
  hardware.nvidia.prime = {
 	offload.enable = true;
 	nvidiaBusId = "PCI:1:0:0";
 	amdgpuBusId = "PCI:5:0:0";
  };

  services.getty.autologinUser = "dee";
  services.displayManager = {
  	autoLogin.user = "dee";
  	autoLogin.enable = false;
  };

  services.pipewire = {
	enable = true;
	pulse.enable =  true;
  };
  security.rtkit.enable = true;
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
 
  # List programs that you want to enable:
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable =  true;
  programs.thunar.enable =  true;
  programs.zsh.enable =  true;
  users.defaultUserShell = pkgs.zsh;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_IN";

  # i18n.extraLocaleSettings = {
  #  LC_ADDRESS = "en_IN";
  #  LC_IDENTIFICATION = "en_IN";
  #  LC_MEASUREMENT = "en_IN";
  #  LC_MONETARY = "en_IN";
  #  LC_NAME = "en_IN";
  #  LC_NUMERIC = "en_IN";
  #  LC_PAPER = "en_IN";
  #  LC_TELEPHONE = "en_IN";
  #  LC_TIME = "en_IN";
  # };
  services.xserver.enable = true;
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dee = {
    isNormalUser = true;
    description = "DeNix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  hardware.bluetooth.enable =  true;
  hardware = {
	opengl.enable = true;
	nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	discord
	git
	kitty
	dunst
	waybar
	hyprpaper
	rofi-wayland
	neofetch
	unzip
 home-manager
  ];

  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	pulse.enable = true;
  };
  
  xdg.portal.enable =  true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };
  programs.thunar.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode"]; })
  ];

  home-manager = {
	extraSpecialArgs = {inherit inputs;};
	users = {
		"dee" = import ./home.nix;
	};
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
