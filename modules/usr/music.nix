{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
    # slskd
    nicotine-plus
    rhythmbox
    tidal-hifi
  ];
}
