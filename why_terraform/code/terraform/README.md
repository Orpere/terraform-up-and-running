# How to use this repo

This repo shows how terraform deploy and start a webserver.

- [X] Create the image using [packer](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/packer) this repo has packer as main dependency.
- [x] Install [terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [x] Install and configure [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [x] Run terraform init/plan/apply
  
- [x] Check if your deployment is working
- Check if your deployment is working
  - Run the command
  
```bash
terraform show
```

  - check for the public dns

```bash
public_dns                   = "ec2-52-14-207-72.us-east-2.compute.amazonaws.com"
```

  - check in your browser http://ec2-52-14-207-72.us-east-2.compute.amazonaws.com/app
  - you should be able to see a **"Hello World"**
  
- [x] Destroy infrastructure

```bash
terraform destroy
```
