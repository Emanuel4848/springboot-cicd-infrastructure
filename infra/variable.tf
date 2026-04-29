variable "do_token" {
  type      = string
  sensitive = true
}

variable "region" {
  default = "sfo3"
}

variable "jenkins_size" {
  default = "s-1vcpu-2gb-amd"
}

variable "registry_size" {
  default = "s-1vcpu-1gb"
}

variable "consumer_size" {
  default = "s-1vcpu-1gb"
}

variable "image" {
  default = "ubuntu-24-04-x64"
}


variable "github_runner_token" {
  type      = string
  sensitive = true
}