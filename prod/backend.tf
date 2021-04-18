terraform {
  backend "s3" {
    bucket         = "sev-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
