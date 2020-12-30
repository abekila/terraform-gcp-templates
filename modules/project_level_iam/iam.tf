resource "google_project_iam_member" "composer_admin" {
  project = var.project_id
  role    = "roles/composer.admin"
  member  = "serviceAccount:${google_service_account.create_service_account.email}"
}

resource "google_project_iam_member" "composer_worker" {
  project = var.project_id
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.create_service_account.email}"
}

resource "google_project_iam_member" "composer_env_storage_admin" {
  project = var.project_id
  role    = "roles/composer.environmentAndStorageObjectAdmin"
  member  = "serviceAccount:${google_service_account.create_service_account.email}"
}

