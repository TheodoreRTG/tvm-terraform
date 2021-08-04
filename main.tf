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
#  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "jenkins-master" {
  name = "jenkins-master"
  build {
    path = "."
    tag = ["jenkins-master:develop"]
    build_arg = {
      foo : "jenkins-master"
                }
    label = {
       author : "theo"
    }
  }
}


resource "docker_container" "jenkins-node" {
  name = "jenkins-node"
  image = docker_image.jenkins-master.latest
}
