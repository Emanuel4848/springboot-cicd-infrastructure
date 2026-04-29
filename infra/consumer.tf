resource "digitalocean_droplet" "consumer" {
  name   = "Devconsumer"
  region = var.region
  size   = var.consumer_size
  image  = var.image

  ssh_keys = ["54362202"]

user_data = templatefile("${path.module}/scripts/install_consumer.sh.tftpl", {
  registry_ip = digitalocean_droplet.registry.ipv4_address_private
  github_runner_token = var.github_runner_token
})

  tags = ["consumer"]
}