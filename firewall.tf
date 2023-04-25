module "beammp" {
  source     = "./modules/port-forward"
  ports      = [30814]
  protocols  = ["tcp", "udp"]
  to_address = "192.168.1.105"
  comment    = "beammp"
}

module "beammp_http" {
  source     = "./modules/port-forward"
  ports      = [8086]
  protocols  = ["tcp"]
  to_address = "192.168.1.105"
  comment    = "beammp http"
}
