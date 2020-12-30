variable project_id {
    description = ""
    type = string
}

variable region {
    description = ""
    type = string
}

variable zone {
    description = ""
    type = string 
}

variable composer_env_name {
    description = ""
    type = string 
}

variable composer_private_env {
    description = "Enable and configure Private IP"
    type = object({
        enabled = bool 
        master_ipv4_cidr_block = string
    })
    default = {
        enabled = false 
        master_ipv4_cidr_block = "172.16.0.0/28"
    }
}

variable node_config {
    description = ""
    type = object({
        disk_size_gb = number 
        machine_type = string
        enable_ip_aliases = bool 
    })
}

variable software_config {
    description = " "
    type = object({
        image_version = string 
        python_version = string
        pypi_packages = map(any)
        env_variables =  map(any)
        airflow_config = map (any)
    })

}

variable node_count {}

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

variable vpc_name {
    type = string 
}

variable cidr_range {
  type = string 
}

variable account_id {
    type = string 
}

variable display_name {
    type = string
}