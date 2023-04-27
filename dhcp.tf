locals {
  network = "192.168.1.0/24"
}

resource "routeros_ip_pool" "dhcp" {
  name   = "dhcp"
  ranges = ["${cidrhost(local.network, 50)}-${cidrhost(local.network, 200)}"]
}

resource "routeros_ip_dhcp_server" "home" {
  address_pool = routeros_ip_pool.dhcp.name
  interface    = "bridge"
  name         = "defconf"
}

resource "routeros_ip_dhcp_server_network" "home" {
  address    = local.network
  gateway    = cidrhost(local.network, 1)
  netmask    = 24
  dns_server = "45.90.28.237,45.90.30.237"
}

resource "routeros_ip_dhcp_client" "client" {
  interface    = "ether1"
  use_peer_dns = false
}

resource "routeros_ip_dhcp_server_lease" "roomba" {
  address     = "192.168.1.50"
  mac_address = "40:9F:38:A8:B6:2A"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "roomba"
}

resource "routeros_ip_dhcp_server_lease" "eve_left" {
  address     = "192.168.1.53"
  mac_address = "8C:AA:B5:1B:39:3F"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "eve left"
}

resource "routeros_ip_dhcp_server_lease" "twisted" {
  address     = "192.168.1.54"
  mac_address = "40:F5:20:29:82:32"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "twisted"
}

resource "routeros_ip_dhcp_server_lease" "kitchen" {
  address     = "192.168.1.57"
  mac_address = "DC:A6:32:A0:78:5B"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "kitchen"
  client_id   = "1:dc:a6:32:a0:78:5b"
}

resource "routeros_ip_dhcp_server_lease" "eve_right" {
  address     = "192.168.1.55"
  mac_address = "40:F5:20:33:54:78"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "eve right"
}

resource "routeros_ip_dhcp_server_lease" "desk" {
  address     = "192.168.1.73"
  mac_address = "8C:4B:14:A8:1C:FC"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "desk"
}

resource "routeros_ip_dhcp_server_lease" "wyzecam1" {
  address     = "192.168.1.77"
  mac_address = "2C:AA:8E:F4:42:2D"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "wyzecam"
  client_id   = "1:2c:aa:8e:f4:42:2d"
}

resource "routeros_ip_dhcp_server_lease" "tv" {
  address     = "192.168.1.79"
  mac_address = "AC:5A:F0:04:7B:9B"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "tv"
  client_id   = "1:ac:5a:f0:4:7b:9b"
}

resource "routeros_ip_dhcp_server_lease" "andy_imac" {
  address     = "192.168.1.80"
  mac_address = "78:7B:8A:D2:31:11"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "andy imac"
  client_id   = "1:78:7b:8a:d2:31:11"
}

resource "routeros_ip_dhcp_server_lease" "newt" {
  address     = "192.168.1.51"
  mac_address = "60:55:F9:D9:BD:06"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "newt"
  client_id   = "1:60:55:f9:d9:bd:6"
}

resource "routeros_ip_dhcp_server_lease" "miniboy" {
  address     = "192.168.1.105"
  mac_address = "48:21:0B:3D:8B:B9"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "miniboy"
  client_id   = "ff:10:54:49:ab:0:2:0:0:ab:11:9e:11:27:36:f5:35:1b:8d"
}

resource "routeros_ip_dhcp_server_lease" "ha" {
  address     = "192.168.1.110"
  mac_address = "E4:5F:01:F6:C2:C3"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "ha"
  client_id   = "1:e4:5f:1:f6:c2:c3"
}

resource "routeros_ip_dhcp_server_lease" "batrium" {
  address     = "192.168.1.137"
  mac_address = "40:91:51:BE:73:F4"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "batrium"
  client_id   = "1:40:91:51:be:73:f4"
}

resource "routeros_ip_dhcp_server_lease" "shield" {
  address     = "192.168.1.199"
  mac_address = "00:04:4B:5C:06:97"
  server      = routeros_ip_dhcp_server.home.name
  comment     = "shield"
  client_id   = "1:0:4:4b:5c:6:97"
}
