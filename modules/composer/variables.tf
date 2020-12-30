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

variable node_count {
    type = string 
}

variable composer_private_env {
    description = "Enable and configure Private IP"
    type = object({
        enabled = bool 
        master_ipv4_cidr_block = string
    })
}

variable node_config {
    description = ""
    type = object({
        disk_size_gb = number 
        machine_type = string
        enable_ip_aliases = bool 
    })
}

variable network {}
variable  subnetwork {}
variable service_account {}

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
