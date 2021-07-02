# tvm-terraform

Creats a terraform docker provider and attempts to deploy an ansible docker image.


# prerequisits:

- Local terraform installation.

- Ansible playbook ../datacentre/ansible

- Local Docker installation

# current Errors:

│ Error: container exited immediately
│ 
│   with docker_container.tensorflow,
│   on main.tf line 26, in resource "docker_container" "tensorflow":
│   26: resource "docker_container" "tensorflow" {
