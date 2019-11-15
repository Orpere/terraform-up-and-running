# Chapter 1

Why Terraform?

- [x] [What is Devops?
- [X] What is infrastructure as code?
- [x] The benefits of infrastructure as code
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

- The benefits of infrastructure as code
  - When your infrastructure are defined as code you are able to use a variety of software engineering practices to dramatically improve your software delivery process, including the following:

    - Self-service -
      If your Infrastructure is defined as IAC is not dependent of just one sysadmin to be deployed and the process can be full automated so the developers can even do them own deployment whenever needed.

    - Speed and safety -
      If a deployment is automated, it will be faster, safer and more reliable and not subject of manual errors.

    - Documentation -
      Instead have all the knowledge in a single head, IAC act as documentation as all state of the infrastructure will be register on source code what will make more easy of anyone take over the owner on case of absence.

    - VersionControl -
      You can store your entire IAC in the same version control, what it means is you have history log of your infrastructure done at each commit. This will give you the possibility to track much faster any issue and rol back to a previous version if needed.

    - Validation -
      As your infrastructure is defined as code you can perform a code review at any change running automatic tests and pass the code trough static analysis tools. This reduce the chance of defects.

    - Reuse -
      You can package your infrastructure into reusable modules instead using one monolithic and complex configuration you can distribute the code in small reusable parcels.

    - Happiness -
      Managing infrastructure manual is tedious and IAC permits the Computer do what his main task which is automate and the Developer coding, reliving the high level of stress from Ops back.

- How Terraform works
  - Terraform is a single binary who works directly on your computer and taking advantage of a single language and toolset (terraform is agnostic) talk directly with the provides APIs to deploy your IAC defined in the terraform files.

  - Here are the main principles of Terraform:

    - Configuration management versus provisioning -
        If you already use some templating tools or such as Docker or Packer the most of your configuration management is already done, so will be much more easy to use a Provision tool as Terraform to deploy those images and control them life cycle

    - Mutable infrastructure versus immutable infrastructure -
        If you use a configuration tool to install por example OpenSsl it will update the actual version of the OpenSsl what can bring issues difficult to diagnose but in other hand if you use a Docker or Packer images you can rollback to the previous image and improve the new one on the first steps of the workflow instead of stop production.
  
    - Procedural language versus declarative language -
        Procedural don't show in total the real state of infrastructure.
        Procedural code limits reusability.

    - Master versus Masterless
        Master needs extra infrastructure, high maintenance, more points where you can have security issues as is more infrastructure to maintain.

    - Agent versus agentless
        services with agents need Bootstrapping, more maintenance and need more one service running it will be more open to attackers.

    - Large community versus small community
        Large community provide us kpi's for how many people are contributing to the development of the tool, how many people use the tool and the improves it need and how fast issues are sorted, this indicators gave us a good perspective if the tool will have a long life or die soon.

    - Mature versus cutting-edge
    - Using multiple tools together
