{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ nixpkgs-fmt ];

  # Create the script as a system-wide command
  environment.etc."formatNixFilesPushToGit.sh" = {
    mode = "0755";
    text = ''
      #!/usr/bin/env bash
      set -e

      REPO=~/nixos-config

      echo "Formatting nix files..."
      find $REPO -name "*.nix" | xargs nixpkgs-fmt

      echo "Checking for changes..."
      if git -C $REPO diff --quiet; then
        echo "No formatting changes, nothing to commit."
      else
        git -C $REPO add .
        git -C $REPO commit -m "style: auto-format nix files"
        git -C $REPO push
        echo "Formatted and pushed."
      fi
    '';
  };
}