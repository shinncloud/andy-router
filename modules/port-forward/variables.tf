variable "ports" {
  description = "List of ports to open"
  type        = list(number)
}

variable "protocols" {
  description = "List of protocols to open per port"
  type        = list(string)
}

variable "to_address" {
  description = "Destination IP address on network"
  type        = string
}

variable "src_address" {
  description = "Source IP address on network"
  type        = string
  default     = "192.168.1.0/24"
}

variable "comment" {
  description = "Comment prefix to add to each entry"
  type        = string
  default     = ""
}

variable "bridge_name" {
  description = "Name of bridge interface"
  type        = string
  default     = "bridge"
}
