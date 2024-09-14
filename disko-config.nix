{
  disko.devices = {
    # nvme is just a name here
    disk.nvme = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            priority = 1;
            start = "0";
            end = "64MiB";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          zfs = {
            priority = 2;
            start = "128MiB";
            end = "100%";
            content = {
              type = "zfs";
              pool = "gene";
            };
          };
        };
      };
    };

    zpool.gene = {
      type = "zpool";
      rootFsOptions = {
        compression = "lz4";
        "com.sun:auto-snapshot" = "false";
        encryption = "aes-256-gcm";
        keyformat="passphrase";
      };
      mountpoint = "/";
      postCreateHook = "zfs snapshot gene@blank";
    };
  };
}
