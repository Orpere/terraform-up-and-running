# Chapter 1

Why Terraform?

- [x] [What is Devops?
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

      Kubernetes, Marathon/Mesos, Amazon ECS,Docker Swarm, and Nomad those orchestration tools are design to Deploy Vms and Containers and making efficient use of your hardware, Roll out updates,monitor heath(auto healing), scale the number of nodes and containers(auto scaling), Distribute traffic across Vms and containers(load balancing), and allow Vms and containers find and talk over the network(service discovery). example: [Kubernetes](https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/kubernetes)

    - Provisioning tools
      Terraform, CloudFormation, and OpenStack are responsible for creating servers,load balancers,queues,monitoring, subnet configurations, firewall settings, routing rules, SSL certificates, and almost all infrastructure components. example [terraform]((https://github.com/orlando-pereira/terraform-up-and-running/tree/master/why_terraform/code/terraform))
