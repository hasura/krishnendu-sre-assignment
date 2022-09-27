terraform {
backend "s3" {
encrypt = true
bucket = "hasura-assignment-stack-state"
key="hasura-assignment-eks-stack/terraform.tfstate"
region = "us-west-2"
dynamodb_table = "terraform-state"
}
}
