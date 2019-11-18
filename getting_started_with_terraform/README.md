# Chapter 2

Getting Started with Terraform

- [x] Setting up your [AWS account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
- [x] Installing [terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [x] Deploying a single [server](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/terraform)
- [x] Version control
- [x] Deploying a single web [server](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/terraform)
- [x] Deploying a configurable web server
- [x] Deploying a cluster of web servers
- [x] Deploying a load balancer
- [x] Cleaning up

For this chapter you will need to attach the **AmazonEC2FullAccess** policy to your IAM user.

For Terraform to be able to access AWS account you will need to be able to access to credentials.

AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, You can export that as environment variables as the follow:

```bash
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

. Terraform code is written in the HashiCorp Configuration Language (HCL) and the files extension are `.tf`

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

```terraform
terraform init #initialize terraform and download plugins and dependencies
```

```terraform
terraform plan #Let you see what terraform will do before making any changes
```

```terraform
terraform apply #this will show the same as plan output and will give you possibility to proceed with changes
```

. If you add for example a tag to your instance resource after you deploy it and apply again.

```terraform
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
```
. You will have the follow result

```terraform
$ terraform apply

aws_instance.example: Refreshing state...
(...)

Terraform will perform the following actions:

  # aws_instance.example will be updated in-place
  ~ resource "aws_instance" "example" {
        ami                          = "ami-0c55b159cbfafe1f0"
        availability_zone            = "us-east-2b"
        instance_state               = "running"
        (...)
      + tags                         = {
          + "Name" = "terraform-example"
        }
        (...)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:

```

Example From: Yevgeniy (Jim) Brikman. “Terraform: Up & Running”.

.Terraform keeps track of all the resources it already created for this set of configuration files and show the diff.

```terraform
terraform destroy # wipe all your infrastructure
```

- Version control

Now you are working with terraform code, you should storage your code and make it versional.
for example you can use GitHub to store your files

```github
git init
git add main.tf
git commit -m "first commit"
```

you should also not upload private files and credentials and for that you must create a **.gitignore** file

```github
.terraform
*.tfstate
*.tfstate.backup
```

terraform graph

http://bit.ly/2rNaeeC

- Deploying a configurable web server
  
. For make the things more configurable we can use variables instead to repeat our selfs

variable "NAME" {
  [CONFIG ...]
}

Number

```terraform
variable "number_example" {
  description = "An example of a number variable in Terraform"
  type        = number
  default     = 42
}
```

List

```terraform
variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list
  default     = ["a", "b", "c"]
}

variable "list_numeric_example" {
  description = "An example of a numeric list in Terraform"
  type        = list(number)
  default     = [1, 2, 3]
}
```

Map

```terraform
variable "map_example" {
  description = "An example of a map in Terraform"
  type        = map(string)

  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}
```

can also create some more complicated structural types

```terraform
variable "object_example" {
  description = "An example of a structural type in Terraform"
  type        = object({
    name    = string
    age     = number
    tags    = list(string)
    enabled = bool
  })

  default = {
    name    = "value1"
    age     = 42
    tags    = ["a", "b", "c"]
    enabled = true
  }
}
```

For get the example more configurable we can replace the port values with variables

- If the default value of the variable is empty Terraform will prompt for the value

    ```terraform
    terraform apply

    var.server_port
    The port the server will use for HTTP requests

    Enter a value:
    ```

- You can also specify the value as:

  ```terraform
  terraform plan -var "server_port=8080
  ```

- Export as env var will also work

    ```terraform
    export TF_VAR_server_port=8080
    ```

- Or write the values on a external file.tfvar

    ```terraform
    vim variables.tfvar
    ~
    server_port = "8080"
    ```

Creating outputs

```terraform
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
```

Deploying a cluster of web servers

- lifecycle if you add **create_before_destroy = true** terraform will create the server first and destroy the old after and reverse.

    ```terraform
    lifecycle {
        create_before_destroy = true
    }
    ```

- The other important point of a cluster are the subnets the same way we declare a resource we declare a vpc but instead resource we will use a data source as:

    ```bash
    data "<PROVIDER>_<TYPE>" "<NAME>" {
    [CONFIG ...]
    }
    ```

    ```terraform
    data "aws_vpc" "default" {
        default = true
    }
    ```
- To get the data out of a data source, you use the following attribute reference syntax:

    ```bash
    data.<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>”
    ```

    for example

    ```terraform
    data "aws_subnet_ids" "default" {
        vpc_id = data.aws_vpc.default.id
    }
    ```

- Now we can add the default subnet id to the load balancer

    ```terraform
    data "aws_vpc" "default" {
    default = true
    }

    data "aws_subnet_ids" "default" {
    vpc_id = data.aws_vpc.default.id
    }

    resource "aws_lb" "example" {

    name = var.alb_name

    load_balancer_type = "application"
    subnets            = data.aws_subnet_ids.default.ids
    security_groups    = [aws_security_group.alb.id]
    }
    ```

- Now define Lb if is alb or elb on the example is alb

    ``` terraform
    resource "aws_lb" "example" {
    name               = "terraform-asg-example"
    load_balancer_type = "application"
    subnets            = data.aws_subnet_ids.default.ids
    }
    ```
- define policy's and security groups as on the [example](https://github.com/orlando-pereira/terraform-up-and-running/blob/master/getting_started_with_terraform/code/cluster/main.tf)