output dag_gcs {
    value = google_composer_environment.create_composer_env.config.0.dag_gcs_prefix
}
