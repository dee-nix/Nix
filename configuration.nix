# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

<<<<<<< HEAD
{ config, pkgs, ... }:
=======
{ config, pkgs, inputs, ... }:
>>>>>>> 8666e58 (flakes and home-manager)

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
<<<<<<< HEAD
    ];

=======
      inputs.home-manager.nixosModules.default
    ];

  # Flakes 
  nix.settings.experimental-features = ["nix-command" "flakes"];

>>>>>>> 8666e58 (flakes and home-manager)
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

<<<<<<< HEAD
  networking.hostName = "Nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

=======
  # boot.kernelParams = ["quiet" "radeon.modeset=0"];

  networking.hostName = "Nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

>>>>>>> 8666e58 (flakes and home-manager)
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
<<<<<<< HEAD
=======
  
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
>>>>>>> 8666e58 (flakes and home-manager)

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_IN";

<<<<<<< HEAD
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
=======
>>>>>>> 8666e58 (flakes and home-manager)
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

<<<<<<< HEAD
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  hardware.bluetooth.enable =  true;
  hardware = {
	opengl.enable = true;
	nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
	(waybar.overrideAttrs (oldAttrs: {
		mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
	})
	) 
	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	git
	discord
	brave
=======
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	discord
	git
>>>>>>> 8666e58 (flakes and home-manager)
	kitty
	dunst
	waybar
	hyprpaper
	rofi-wayland
	neofetch
<<<<<<< HEAD
	unzip
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
=======
	pyprland
	unzip
	brave
	home-manager
  ];
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
>>>>>>> 8666e58 (flakes and home-manager)

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
<<<<<<< HEAD

=======
>>>>>>> 8666e58 (flakes and home-manager)
}
