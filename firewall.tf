locals {
  ip_miniboy = "192.168.1.105"
}

module "beammp" {
  source     = "./modules/port-forward"
  ports      = [30814]
  protocols  = ["tcp", "udp"]
  to_address = local.ip_miniboy
  comment    = "beammp"
}

module "beammp_http" {
  source     = "./modules/port-forward"
  ports      = [8086]
  protocols  = ["tcp"]
  to_address = local.ip_miniboy
  comment    = "beammp http"
}

module "caddy_http" {
  source     = "./modules/port-forward"
  ports      = [443]
  protocols  = ["tcp"]
  to_address = local.ip_miniboy
  comment    = "caddy http"
}
