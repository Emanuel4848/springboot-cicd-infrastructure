resource "digitalocean_droplet" "registry" {
  name   = "Devregistry"
  region = var.region
  size   = var.registry_size
  image  = var.image

  ssh_keys = ["54362202"]

  user_data = file("${path.module}/scripts/install_registry.sh")

  tags = ["registry"]
}