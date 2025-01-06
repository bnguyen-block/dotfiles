{userDetails, ...}: {
  networking = {
    hostName = userDetails.hostName;
    computerName = userDetails.computerName;
  };
}
