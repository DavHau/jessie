{
  # users
  users.mutableUsers = false;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0phC/CSTdXqP/vvoCLHA5ZDpfnOJsTQzqpBU3F4qvB"
  ];
  users.users.jessie.isNormalUser = true;
  users.users.jessie.extraGroups = [ "wheel" ];

  # ssh
  services.openssh.enable = true;
}
