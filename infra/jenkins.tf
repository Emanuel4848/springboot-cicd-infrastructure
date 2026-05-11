resource "digitalocean_droplet" "jenkins" {
  name   = "Devjenkins"
  region = var.region
  size   = var.jenkins_size
  image  = var.image

  ssh_keys = ["YOUR_SSH_KEY_ID"]

  user_data = templatefile("${path.module}/scripts/install_jenkins.sh.tftpl", {
  registry_ip = digitalocean_droplet.registry.ipv4_address_private
})

  tags = ["jenkins"]
}