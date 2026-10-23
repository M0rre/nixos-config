{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.gpg-custom;
in
{
  options.programs.gpg-custom = {
    enable = mkEnableOption "GPG with agent and pinentry";

    pinentryPackage = mkOption {
      type = types.package;
      default = pkgs.pinentry-curses;
      description = "Pinentry program to use (curses, gtk2, gnome3, qt, etc.)";
    };

    defaultCacheTtl = mkOption {
      type = types.int;
      default = 600;
      description = "Seconds to cache passphrase in agent";
    };

    maxCacheTtl = mkOption {
      type = types.int;
      default = 7200;
      description = "Max seconds before forced re-entry";
    };

    sshSupport = mkOption {
      type = types.bool;
      default = false;
      description = "Enable gpg-agent as SSH agent";
    };

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Extra lines appended to gpg-agent.conf";
    };
  };

  config = mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = cfg.pinentryPackage;
      enableSSHSupport = cfg.sshSupport;
    };

    environment.sessionVariables = mkIf cfg.sshSupport {
      SSH_AUTH_SOCK = "$(${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)";
    };
  };
}
