provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = "us-west-2"
  }



module "vpc" {
source = ".//module/vpc"
}


module "loadbalancer" {
source = ".//module/loadbalancer"
  vpc_id = "${module.vpc.vpc_id}"
  public_securitygroup_id = "${module.vpc.public_securitygroup_id}"
  subnet_id_public = "${module.vpc.subnet_id_public}"
  subnet_id_private = "${module.vpc.subnet_id_private}"
}



module "cluster" {
source = ".//module/cluster"

target_group_arn = "${module.loadbalancer.target_group_arn}"
}


module "autoscaling" {
source = ".//module/autoscaling"
  ecs_cluster = "${module.cluster.ecs_cluster}"
  subnet_id_public = "${module.vpc.subnet_id_public}"
  public_securitygroup_id = "${module.vpc.public_securitygroup_id}"
  subnet_id_private = "${module.vpc.subnet_id_private}"
}
