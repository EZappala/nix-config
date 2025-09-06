{lib}: rec {
  nameservers = [
    # IPv4
    "1.1.1.1" # Cloudflare
    "1.0.0.1" # Cloudflare
    # IPv6
    "2606:4700:4700::1111 " # Cloudflare
    "2606:4700:4700::1001" # Cloudflare
  ];

  hostsAddr = {
    luffy = {
      iface = "wlp27s0f0";
    };
  };
}
