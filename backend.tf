
terraform {
backend "s3" {
bucket = "santhosh-file"
key    = "terraform-aws/terraform.tfstate"
region = "us-west-2"
encrypt = true

}

}
