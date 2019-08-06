
terraform {
backend "s3" {
bucket = "santhosh-file"
dynamodb_table = "terraform-state-lock-dynamo"
key    = "terraform-aws/terraform.tfstate"
region = "us-west-2"
encrypt = true

}

}
