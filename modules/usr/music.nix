{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # slskd
    nicotine-plus
    rhythmbox
  ];
}
