resource "google_compute_instance" "vm" {
  name         = "my-vm"
  machine_type = "e2-standard-4"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 100
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "default"

    access_config {
      # Ephemeral external IP
    }
  }

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}