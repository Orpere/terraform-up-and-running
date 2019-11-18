# How to use this repo

This repo shows how terraform deploy and start a webserver.

- [x] Install [terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [x] Install and configure [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- [x] Run terraform init/plan/apply
  
- [x] Check if your deployment is working
- Check if your deployment is working
  - Run the command
  
```bash
terraform show
```

  - check for the alb

```bash
curl http://<alb_dns_name>
```

  - check in your browser http://ec2-52-14-207-72.us-east-2.compute.amazonaws.com/app
  - you should be able to see a **"Hello World"**
  
- [x] Destroy infrastructure

```bash
terraform destroy
```
