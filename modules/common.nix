{ config, lib, pkgs, ... }:

{
  imports = [ ./cli.nix ./scripts.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.xserver.enable = true;
  services.xserver.xkb.layout = "se";

  services.openssh.enable = true;

  programs.nano = {
    enable = true;
    nanorc = ''
      set tabsize 4
      set tabstospaces
    '';
  };

  environment.systemPackages = with pkgs; [
    cmatrix
    file
    fortune
    git
    micro
    nano
    nixpkgs-fmt
    screen
    tree
    unzip
    vim
    wget
    zip
    python3
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];
}
