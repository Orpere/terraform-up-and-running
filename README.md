# Terraform Up &amp; Running

This repo has intention of help on the reading and interpretation of the book [**Terraform: Up &amp; Running**](https://www.terraformupandrunning.com/)

As main goal you should be able to answer to:

- Why use IaC at all?
- What are the differences between configuration management, orchestration, provisioning, and server templating?
- When should you use Terraform, Chef, Ansible, Puppet, Salt, CloudFormation, Docker, Packer, or Kubernetes?
- How does Terraform work and how do you use it to manage your infrastructure?
- How do you create reusable Terraform modules?
- How do you write Terraform code that’s reliable enough for production usage?
- How do you test your Terraform code?
- How do you make Terraform a part of your automated deployment process?
- What are the best practices for using Terraform as a team?

Excerpt From: Yevgeniy (Jim) Brikman. “Terraform: Up & Running”

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

Excerpt From: Yevgeniy (Jim) Brikman. “Terraform: Up & Running”

**NOTE:** This is not an exhaustive reference manual for that please check the Terraform [documentation](https://www.terraform.io/docs/index.html)

## code and explanations`:`

- [x] [Why Terraform](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform)
- [ ] [Getting Started with Terraform](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/getting_started_with_terraform)
- [ ] How to manage Terraform State
- [ ] How to Create Reusable infrastructure with Terraform Modules
- [ ] Terraform Tips and Tricks: Loops, If-Statements, Deployment, and Gotchas
- [ ] Production-Grade Terraform Code
- [ ] How to Test Terraform Code
- [ ] How to use Terraform as Team
