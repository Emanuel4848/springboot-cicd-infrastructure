resource "digitalocean_droplet" "registry" {
  name   = "Devregistry"
  region = var.region
  size   = var.registry_size
  image  = var.image

  ssh_keys = ["YOUR_SSH_KEY_ID"]

  user_data = file("${path.module}/scripts/install_registry.sh")

  tags = ["registry"]
}