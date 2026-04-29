output "jenkins_ip" {
  value = digitalocean_droplet.jenkins.ipv4_address
}

output "registry_ip" {
  value = digitalocean_droplet.registry.ipv4_address
}

output "consumer_ip" {
  value = digitalocean_droplet.consumer.ipv4_address
}