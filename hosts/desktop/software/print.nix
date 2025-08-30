{ pkgs, ... }:

{
  # CUPS
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip hplipWithPlugin ];
  };

}
