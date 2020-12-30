variable project_id {
  type = string
}

variable region {
  type = string
}

variable zone {
  type = string
}

variable auto_create_subnetworks {
  type = bool 
}

variable routing_mode {
  type = string
}

variable delete_default_routes_on_create {
  type = bool 
}

variable subnet_name {
    type = string 
}


variable cidr_range {
  type = string 
}

variable vpc_name {
  type = string 
}