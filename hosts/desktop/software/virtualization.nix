{ ... }:

let
  usrname = "leonardo";
in
{
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "${usrname}" ];

  virtualisation = {
    libvirtd.enable = true;

    spiceUSBRedirection.enable = true;
  };
}
