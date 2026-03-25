# =====================
# Console customisation
# =====================

{ config, lib, pkgs, ... }:

{
  # Create /etc/starship.toml for all users
  environment.etc."starship.toml".text = ''
  "$schema" = 'https://starship.rs/config-schema.json'

  [aws]
  symbol = " "

  [buf]
  symbol = " "

  [bun]
  symbol = " "

  [c]
  symbol = " "

  [cpp]
  symbol = " "

  [cmake]
  symbol = " "

  [conda]
  symbol = " "

  [crystal]
  symbol = " "

  [dart]
  symbol = " "

  [deno]
  symbol = " "

  [directory]
  read_only = " 󰌾"
  [docker_context]
  symbol = " "

  [elixir]
  symbol = " "

  [elm]
  symbol = " "

  [fennel]
  symbol = " "

  [fortran]
  symbol = " "

  [fossil_branch]
  symbol = " "

  [gcloud]
  symbol = " "

  [git_branch]
  symbol = " "

  [git_commit]
  tag_symbol = '  '

  [golang]
  symbol = " "

  [gradle]
  symbol = " "

  [guix_shell]
  symbol = " "

  [haskell]
  symbol = " "

  [haxe]
  symbol = " "

  [hg_branch]
  symbol = " "

  [hostname]
  ssh_symbol = " "

  [java]
  symbol = " "

  [julia]
  symbol = " "

  [kotlin]
  symbol = " "

  [lua]
  symbol = " "

  [memory_usage]
  symbol = "󰍛 "

  [meson]
  symbol = "󰔷 "

  [nim]
  symbol = "󰆥 "

  [nix_shell]
  symbol = " "

  [nodejs]
  symbol = " "

  [ocaml]
  symbol = " "

  [os.symbols]
  Alpaquita = " "
  Alpine = " "
  AlmaLinux = " "
  Amazon = " "
  Android = " "
  AOSC = " "
  Arch = " "
  Artix = " "
  CachyOS = " "
  CentOS = " "
  Debian = " "
  DragonFly = " "
  Elementary = " "
  Emscripten = " "
  EndeavourOS = " "
  Fedora = " "
  FreeBSD = " "
  Garuda = "󰛓 "
  Gentoo = " "
  HardenedBSD = "󰞌 "
  Illumos = "󰈸 "
  Ios = "󰀷 "
  Kali = " "
  Linux = " "
  Mabox = " "
  Macos = " "
  Manjaro = " "
  Mariner = " "
  MidnightBSD = " "
  Mint = " "
  NetBSD = " "
  NixOS = " "
  Nobara = " "
  OpenBSD = "󰈺 "
  openSUSE = " "
  OracleLinux = "󰌷 "
  Pop = " "
  Raspbian = " "
  Redhat = " "
  RedHatEnterprise = " "
  RockyLinux = " "
  Redox = "󰀘 "
  Solus = "󰠳 "
  SUSE = " "
  Ubuntu = " "
  Unknown = " "
  Void = " "
  Windows = "󰍲 "
  Zorin = " "

  [package]
  symbol = "󰏗 "

  [perl]
  symbol = " "

  [php]
  symbol = " "

  [pijul_channel]
  symbol = " "

  [pixi]
  symbol = "󰏗 "

  [python]
  symbol = " "

  [rlang]
  symbol = "󰟔 "

  [ruby]
  symbol = " "

  [rust]
  symbol = "󱘗 "

  [scala]
  symbol = " "

  [status]
  symbol = " "

  [swift]
  symbol = " "

  [xmake]
  symbol = " "

  [zig]
  symbol = " "
  '';

  programs.zsh = {
    enable = true;
    promptInit = "eval \"$(starship init zsh)\"";


    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # This goes in /etc/zshrc and applies to ALL users
    interactiveShellInit = ''
      # Your shared config here
      # This runs for every user's interactive shell
      # Point all users to the shared starship config
      export STARSHIP_CONFIG=/etc/starship.toml


# ===================

cat << "EOF"

⢀⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆
⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠁⠸⣼⡿
⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉⠀⠀⠀⠀⠀
⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⠿⠿⠿⠛⠉

EOF
    '';

    # Or use shellAliases for common aliases
    shellAliases = {
      ll = "ls -la";
      nixupdate = "git -C ~/nixos-config pull && sudo nixos-rebuild switch --flake ~/nixos-config#mainserver";
      c = "clear";
      aacm = "git add .; git commit -m";
    };
  };
  users.defaultUserShell = pkgs.zsh;


  environment.systemPackages = with pkgs; [
    starship
    zsh-autosuggestions
  ];
}
