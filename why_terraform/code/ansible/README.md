# How to use this file

- Install [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#basics-what-will-be-installed)
- Install [Vagrant](https://www.vagrantup.com/docs/installation/)
- Generate an [ssh Key](https://help.github.com/en/enterprise/2.16/user/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- You must have the [repo](https://github.com/orlando-pereira/terraform-up-and-running) clone in your computer

- You should be into the ansible directory

```bash
   git clone git@github.com:orlando-pereira/terraform-up-and-running.git #if is not cloned

   cd terraform-up-and-running

   cd why_terraform/code/ansible

```

- Edit the vagrant file and change the PUBKEY value

```vagrant
PUBKEY = "/Users/orlando/.ssh/id_rsa.pub"

```

- Run vagrant up:

```bash
   vagrant up
```

- Run Ansible

```ansible
ansible-playbook playbook.yaml
```

**NOTE:** please check if you gave other than the default name to your ssh keys replace the _private_key_file_ value on ansible.cfg

now you can type on your browser `http://11.11.11.11/app` `http://11.11.11.12/app` `http://11.11.11.13/app` `http://11.11.11.14/app` `http://11.11.11.15/app`

you can see **hello world**

- Run vagrant destroy

```bash
   vagrant destroy
```
