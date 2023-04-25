locals {
  port_protocol_map = {
    for index, pair in setproduct(var.ports, var.protocols) : index => {
      port     = pair[0]
      protocol = pair[1]
    }
  }
}

resource "routeros_ip_firewall_nat" "dst_nat" {
  for_each = local.port_protocol_map

  action           = "dst-nat"
  chain            = "dstnat"
  dst_address_type = "local"
  dst_port         = each.value.port
  protocol         = each.value.protocol
  to_addresses     = var.to_address
  to_ports         = each.value.port
  comment          = "${var.comment} ${each.value.port} ${each.value.protocol}"
}

resource "routeros_ip_firewall_nat" "local_masquerade" {
  for_each = local.port_protocol_map

  action        = "masquerade"
  chain         = "srcnat"
  src_address   = var.src_address
  dst_address   = var.to_address
  out_interface = var.bridge_name
  protocol      = each.value.protocol
  dst_port      = each.value.port
  comment       = "${var.comment} ${each.value.port} ${each.value.protocol}"
}
