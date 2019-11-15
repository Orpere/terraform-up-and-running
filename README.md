# Terraform Up &amp; Running 

This repo has intention of help on the reading and interpretation of the book [**Terraform: Up &amp; Running**](https://www.terraformupandrunning.com/)

Author: Yevgeniy Brikman

“[Terraform](https://www.terraform.io/) is an open source tool created by HashiCorp that allows you to define your infrastructure as code using a simple, declarative language and to deploy and manage that infrastructure across a variety of public cloud providers (e.g., Amazon Web Services, Microsoft Azure, Google Cloud Platform, DigitalOcean) and private cloud and virtualization platforms (e.g., OpenStack, VMWare) using a few commands. For example, instead of manually clicking around a web page or running dozens of commands, here is all the code it takes to configure a server on AWS:”

```terraform
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

And to deploy it, you just run the following:

```terraform
terraform init
Terraform apply
```

Excerpt From: Yevgeniy (Jim) Brikman. “Terraform: Up & Running”. Apple Books.

- [ ] This is an incomplete item
