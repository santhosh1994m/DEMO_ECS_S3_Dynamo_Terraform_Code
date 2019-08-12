variable "ecs_cluster" {}
variable "public_securitygroup_id" {}
variable "subnet_id_public" {}
variable "subnet_id_private" {}


#variable "amis" {
#description = "Base AMI to launch the instances"
#default = "ami-0f2176987ee50226e"
#}

variable "ecs_key_pair_name" {
  description = "EC2 instance key pair name"
  default = "santhosh-test-key"
}
