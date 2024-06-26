locals {
  ip_miniboy   = "192.168.1.105"
  ip_laraboy   = "192.168.1.104"
  ip_macpro    = "192.168.1.63"
  ip_meshstats = "192.168.1.93"
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
  ports      = [443, 80]
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

module "ats" {
  source     = "./modules/port-forward"
  ports      = [27015, 27016]
  protocols  = ["tcp", "udp"]
  to_address = local.ip_miniboy
  comment    = "ats trucks"
}

module "laraboy" {
  source     = "./modules/port-forward"
  ports      = [22]
  protocols  = ["tcp"]
  to_address = local.ip_laraboy
  comment    = "laraboy"
}

module "certbot_meshstats" {
  source     = "./modules/port-forward"
  ports      = [8094]
  protocols  = ["tcp"]
  to_address = local.ip_meshstats
  comment    = "meshstats certbot"
}

module "mqtt_meshstats" {
  source     = "./modules/port-forward"
  ports      = [1883, 8883, 8083, 8084]
  protocols  = ["tcp"]
  to_address = local.ip_meshstats
  comment    = "meshstats mqtt"
}
