provider "aws" {

region = "${var.region}"
shared_credentials_file = "~/.aws/credentials"

}



module "vpc" {
source = ".//module/vpc"
}


module "loadbalancer" {
source = ".//module/loadbalancer"
  vpc_id = "${module.vpc.vpc_id}"
  public_securitygroup_id = "${module.vpc.public_securitygroup_id}"
  subnet_id = "${module.vpc.subnet_id_public}"
  subnet_test_id = "${module.vpc.subnet_id_private}"


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


resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${module.aws_autoscaling_group.ecs-autoscaling-group.id}"
  alb_target_group_arn   = "${module.loadbalancer.target_group_arn}"
}
