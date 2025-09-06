{
  myvars,
  lib,
}:
let
  username = myvars.username;
  hosts = [
    "luffy"
  ];
in
lib.genAttrs hosts (_: "/home/${username}")
