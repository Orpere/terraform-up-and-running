# How to manage Terraform State

- [x] What is Terraform state?
- [x] Shared storage for state files
- [x] Limitations with Terraform’s backends
- [x] Isolating state files
- [x] The terraform_remote_state data source

- What is Terraform state?
  Terraform records information about the infrastructure created under format of state files. The state files are created in JSON with format _terraform.tfsatte_.
  The state is the vision terraform has of the real world.

- Shared storage for state files
  If you run a terraform on a project of your own you will have the state file on you project root directory but if you have more people with you have to share the workload that option start not be viable, so you will need a shar localization for the state file.

- Isolating state files
  As you need to share the workload you will need to lock the state which will    avoid corruption and conflicts between team member actions.
  The best practices will be isolate environments, for example dev, staging and production, as you will not be happy if some change done in dev will affect production.
  Sharing state files bring us a few challenges as is not good practices to store it on Version control as Git by the follow reasons:
  - **Manual error** -  is to easy to pull the last changes or upload them.
  - **Locking** - most ov version control don't have a loking feature what don't avoid   two team members to commit on same time.
  - **Secrets** - As we know is not good to left secrets on version control as governance is need it.
- Instead of using version control, the best way is use a built-in support for remote backend.
  Remote backend alow we to store the state file into a remote shared store terraform has a several number of accepted ][backends](https://www.terraform.io/docs/backends/index.html)
  This type of backend will sort the tree issues already listed

- syntax
  
   ```terraform
    terraform {
        backend "<BACKEND_NAME>" {
        [CONFIG...]
        }
    }
    ```

- Isolation via workspaces -
  the workspaces permit us to create different state files per env on the same backend
  
- Isolation via file layout -
  split environments in different folders and backend using different mechanisms of authentication
  This process have two major inconvenient:
  - can't deploy your infrastructure in one command
  - make difficult to use resources dependencies
  - code duplication

- Remote state data source
  
  ```terraform
    data "terraform_remote_state" "db" {
        backend = "s3"

        config = {
            bucket = "orlando-workspace"
            key    = "stage/data-stores/webserver-cluster/terraform.tfstate"
            region = "us-east-2"
        }
    }
  ```
