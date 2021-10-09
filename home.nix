{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "Octo";
  home.homeDirectory = "/home/Octo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  programs.git = {
    enable = true;
    userName  = "thirteen-incense";
    userEmail = "thirteenincense@gmail.com";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
  };

  home.packages = with pkgs; [
    #tool
    vim git wget fish clash rofi ranger emacs fd fzf
    youtube-dl vscode-fhs imagemagick scrot wine vsftpd
    ffmpeg aria rebar3 zip unzip unrar p7zip
    
    #base
    iwd vlc feh xclip ntfs3g clang clang-tools cmake ninja
    postgresql
   
    #toy
    tree neofetch steam qbittorrent htop virtualbox sxiv

    #lang
    erlang elixir lua rustup go clisp python

    alacritty
    chromium
    google-chrome
  ];

  home.file = {
    ".config/alacritty/alacritty.yml".source = ./config/alacritty.yml;
  };
}
