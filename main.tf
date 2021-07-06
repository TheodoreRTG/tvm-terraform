terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.13.0"
    }
#   ansible = {
#     source = "cloudposse/ansible/null"
#     version = "0.6.0"
#   }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image

resource "docker_image" "ansible" {
  name = "ansible/ansible:ubuntu1404"
  keep_locally = true
}

# Create a container
resource "docker_container" "ansible" {
  image = docker_image.ansible.latest
  name  = "ansible"
  command = ["apt-get install git", "git clone https://github.com/Linaro/datacentre.git", "cd datacentre/ansible", "ansible-playbook -i run_local -l localhost -e @main_build_vars.yml build_tensorflow.yml"]

  ports {
    external = 8080
    internal = 80
  }

}

#module "ansible_provisioner" {
# source = "github.com/cloudposse/tf_ansible"
#  arguments = ["--user=ubuntu"]
#  envs = ["host=docker_container.ansible"]
#  playbook = "../datacentre/ansible/build_tensorflow.yml"
#  dry_run = false
#}
