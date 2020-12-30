resource "google_compute_subnetwork" "core_subnet" {
  project                  = var.project_id
  name                     = "${var.project_id}-subnet"
  ip_cidr_range            = var.cidr_range
  region                   = var.region
  network                  = google_compute_network.core_vpc_network.id
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"

  }

}
