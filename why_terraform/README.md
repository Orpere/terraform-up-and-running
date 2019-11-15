# Chapter 1

Why Terraform?

- [x] What is Devops?
- [X] What is infrastructure as code?
- [ ] The benefits of infrastructure as code
- [ ] How Terraform works
- [ ] How Terraform compares to other infrastructure as code tools”

- What is Devops?
  - Devops is not a team or a job is the set of ideas and techniques which objective is short the distance between "Devs" and "Ops" teams with the main goal to a faster and reliable software delivery, avoiding human errors.
  
    “The goal of DevOps is to make software delivery vastly more efficient.”
    Excerpt From: Yevgeniy (Jim) Brikman. “Terraform: Up & Running”.

- What is infrastructure as code?
  - The idea of IAC is write and execute code to define, deploy ,update and destroy your infrastructure.
  - There are five broad categories of IAC tools:
  
    - Ad hoc scripts, example [setup-webserver.sh](https://github.com/orlando-pereira/terraform-up-and-running/blob/master/why_terraform/code/adhoc/setup-webserver.sh)
    - Configuration management tools
  
        Chef, Puppet, Ansible, and SaltStack example [Ansible](https://github.com/orlando-pereira/terraform-up-and-running/blob/master/why_terraform/code/ansible) and those tools are design to install and manage software on existent servers

    - Server templating tools

        Docker, Packer and Vagrant and those tools are design to create images or "snapshots" of the OS,the files and other details for you can install that images across your servers or containers.
        example: [packer template](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/packer)

    - Orchestration tools
    - Provisioning tools
