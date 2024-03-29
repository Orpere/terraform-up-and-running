# Packer example

This folder shows an example [Packer](https://www.packer.io/) template that can be used to create an [Amazon Machine
Image (AMI)](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html) of an Ubuntu server with Apache, PHP, and
a sample PHP app installed.

For more info, please see Chapter 1, "Why Terraform", of
*[Terraform: Up and Running](http://www.terraformupandrunning.com)*.

## Pre-requisites

* You must have [Packer](https://www.packer.io/) installed on your computer.
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

## Quick start

**Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure 
all the resources qualify for the [AWS Free Tier](https://aws.amazon.com/free/), but we are not responsible for any
charges you may incur.** 

Configure your [AWS access 
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as 
environment variables:

```bash
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

To build the AMI:

```bash
packer build webserver.json
```

You should have a result similar to

```bash
Build 'amazon-ebs' finished.

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:
us-east-2: ami-0b3192b6308bb1b49
```
