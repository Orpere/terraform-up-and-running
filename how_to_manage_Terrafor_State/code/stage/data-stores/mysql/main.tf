provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {

    bucket         = "orlando-workspace"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "orlando-locks"
    encrypt        = true

  }
}

resource "aws_db_instance" "stage-orlando" {
  identifier_prefix = "terraform-up-and-running"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = var.db_name
  username          = "admin"

  # How should we set the password?
  skip_final_snapshot = true

  password = var.db_password
}
