# S3 with Dinodb lock

- Start
   terraform init/plan/apply

  add to your code

  ```terraform
    terraform {
        backend "s3" {

          bucket         = "orlando-workspace"
          key            = "orlando-workspace/terraform.tfstate"
          region         = "us-east-2"
          dynamodb_table = "orlando-locks"
          encrypt        = true

        }
    }

  ```

``` Terraform
 terraform init

Initializing the backend...
Acquiring state lock. This may take a few moments...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the”
```

- clean backend:

- Go to the Terraform code, remove the backend configuration, and re run terraform init to copy the Terraform state back to your local disk.

- Run terraform destroy to delete the S3 bucket and DynamoDB table
