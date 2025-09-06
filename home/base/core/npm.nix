{ config, ... }:
{
  # make `npm install -g <pkg>` happy
  # mainly used to install npm packages that update frequently
  home.file.".npmrc".text = ''
    prefix=${config.home.homeDirectory}/.npm
  '';
}
