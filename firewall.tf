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
  ports      = [443, 8020]
  protocols  = ["tcp"]
  to_address = local.ip_miniboy
  comment    = "caddy http"
}

module "acc_udp" {
  source     = "./modules/port-forward"
  ports      = [9231]
  protocols  = ["tcp", "udp"]
  to_address = local.ip_miniboy
  comment    = "acc udp"
}

module "acc_tcp" {
  source     = "./modules/port-forward"
  ports      = [9232]
  protocols  = ["tcp"]
  to_address = local.ip_miniboy
  comment    = "acc tcp"
}
