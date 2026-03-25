# configuration.nix mainserver
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  boot.loader.grub.device = "/dev/nvme0n1";

  networking.hostName = "macks";

  # Users
  users.users.max = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    home = "/home/max";
    packages = with pkgs; [ tree ];
  };


  # DuckDNS
  services.duckdns = {
    enable = true;
    domains = [ "macks" ];
    tokenFile = "/var/lib/secrets/duckdnsToken";
  };

  # ACME / SSL
  users.users.nginx.extraGroups = [ "acme" ];
  security.acme = {
    acceptTerms = true;
    defaults.email = "moren.maxen@gmail.com";
    certs."macks.duckdns.org" = {
      dnsProvider = "duckdns";
      environmentFile = "/var/lib/secrets/duckdns.env";
      extraDomainNames = [ "*.macks.duckdns.org" ];
    };
  };

  # Nginx
  services.nginx = {
    enable = true;
    virtualHosts."macks.duckdns.org" = {
      useACMEHost = "macks.duckdns.org";
      forceSSL = true;
      root = "/var/www/html";
    };
    virtualHosts."map.macks.duckdns.org" = {
      useACMEHost = "macks.duckdns.org";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8100";
        proxyWebsockets = true;
      };
    };
  };

  # Server packages
  environment.systemPackages = with pkgs; [
    lynx
    w3m
    elinks
    jdk
    nginx
    (python3.withPackages (python-pkgs: [
      python-pkgs.requests
    ]))
  ];

  # Firewall
  networking.firewall.allowedTCPPorts = [ 25565 25575 25566 8100 80 443 ];
  networking.firewall.allowedUDPPorts = [ 24454 ];

  system.stateVersion = "25.11";
}
