{
  config,
  mysecrets,
  ...
}:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = true;
  };
}
