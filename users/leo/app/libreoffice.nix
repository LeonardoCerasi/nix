{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.it_IT
    hunspellDicts.en_US
    hunspellDicts.fr-any
    hunspellDicts.de_DE
  ];
}
