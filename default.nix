{ lib, pkgs, ... }:
{
  systemd.generators.systemd-zfs-generator = pkgs.substituteAll {
    name = "systemd-zfs-generator";
    src = ./systemd-zfs-generator.sh;
    inherit (pkgs) bash gawk zfs systemd busybox;
    isExecutable = true;
  };
  systemd.services.zfs-mount.enable = lib.mkForce false;
}
