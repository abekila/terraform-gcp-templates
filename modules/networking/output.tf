output "vpc" {
  value = google_compute_network.core_vpc_network.name
}

output "subnet" {
    value = google_compute_subnetwork.core_subnet.name
}
