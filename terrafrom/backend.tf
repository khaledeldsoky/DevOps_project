terraform {
  backend "s3" {
    bucket = "khaled-project1-s3"
    key    = "devops_project.tfstate"
    region = "us-east-1"
  }
}
