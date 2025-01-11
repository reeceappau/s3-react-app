# terraform {
#   backend "s3" {
#     bucket         = "s3ra-state-bucket"
#     key            = "website/terraform.tfstate"
#     region         = "eu-west-2"
#     dynamodb_table = "s3ra_state_table"
#   }
# }