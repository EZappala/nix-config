{
  myvars,
  config,
  ...
}:
{
  # Don't allow mutation of users outside the config.
  users.mutableUsers = true;

  users.groups = {
    "${myvars.username}" = { };
    podman = { };
    wireshark = { };
    # for android platform tools's udev rules
    adbusers = { };
    dialout = { };
    # for openocd (embedded system development)
    plugdev = { };
    # misc
    uinput = { };
  };

  users.users."${myvars.username}" = {
    home = "/home/${myvars.username}";
    description = "${myvars.userfullname}";
    isNormalUser = true;
    extraGroups = [
      myvars.username
      "users"
      "wheel"
      "networkmanager" # for nmtui / nm-connection-editor
      "podman"
      "wireshark"
    ];
  };
}
