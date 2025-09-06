{ config, lib, ... }:
{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
  hardware.nvidia = {
    # Modesetting is required (although the nixos wiki fails to elaborate why)
    modesetting.enable = true;

    # Can be enabled if issues occur when loading programs after sleep.
    # Experimental power management dumps the vram to /tmp
    powerManagement.enable = true;
    
    # Fine-grained power management. Turns off GPU when not in use.
    # TODO: Need to enable Offload first, then we can turn this back on
    powerManagement.finegrained = true;
    
    # use Nvidia's open source drivers. (As of july 2024, 
    # all nvidia kernels are open source)
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
