# Chapter 2

Getting Started with Terraform

- [x] Setting up your [AWS account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
- [x] Installing [terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [ ] Deploying a single [server]((https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/terraform))
- [ ] Deploying a single web [server](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/terraform)
- [ ] Deploying a configurable web server
- [ ] Deploying a cluster of web servers
- [ ] Deploying a load balancer
- [ ] Cleaning up

For this chapter you will need to attach the **AmazonEC2FullAccess** policy to your IAM user.

For Terraform to be able to access AWS account you will need to be able to access to credentials.

AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, You can export that as environment variables as the follow:

```bash
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

. Terraform code is written in the HashiCorp Configuration Language (HCL) and the files extension is `.tf`

. In main.tf should be defined the provider as the follow:

```
resource "<PROVIDER>_<TYPE>" "<NAME>" {
  [CONFIG ...]
}
```

```terraform
provider "aws" {
  region = "us-east-2"
}
```

. For see how to deploy a single web server you can check the code in [server](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/terraform)

The commands must start from the terraform files directory as:

```Terraform
terraform init #initialize terraform and download plugins and dependencies
```

```Terraform
terraform plan #Let you see what terraform will do before making any changes
```

```Terraform
terraform apply #this will show the same as plan output and will give you possibility to proceed with changes
```

```Terraform
terraform apply #this will show the same as plan output and will give you possibility to proceed with changes
```