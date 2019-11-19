# workspaces

- check the workspace
  
```terraform
terraform workspace show
default
```

- create a workspace

```terraform
terraform workspace new example1
Created and switched to workspace "example1"!
```

- run terraform plan to see what happen

```terraform
Plan: 1 to add, 0 to change, 0 to destroy.
# as you can see the instance was already created and now terraform is creating other for the workspace
```

- run terraform apply and check your s3 bucket
  
```bash
the path has changed to env:/example1/orlando-workspace/terraform.tfstate
```

- run terraform workspace list

```terraform
terraform workspace list
default
* example1
```

- select a workspace

```terraform
terraform workspace select default
Switched to workspace "default".

terraform workspace list
* default
example1
```
