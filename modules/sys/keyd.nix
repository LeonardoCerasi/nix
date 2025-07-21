{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    keyd
  ];

  services.keyd = {
    enable = true;

    keyboards = {

      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control,esc)";
            leftcontrol = "backspace";
          };
        };
      };

    };
  };
}
