resource "routeros_dns" "server" {
  allow_remote_requests = true
  servers               = "45.90.28.237,45.90.30.237"
}
