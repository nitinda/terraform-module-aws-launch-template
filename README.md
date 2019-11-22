# Terraform Module Name: terraform-module-launch-template


## General

This module may be used to create Launch Template resources in AWS cloud provider..

---


## Prerequisites

This module needs Terraform 0.11.10 or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys aws services details are in respective feature branches.

---

## Features Branches

Below we are able to check the resources that are being created as part of this module call:

From branch : **_terraform-11/master_**

* **_Launch Template (Terraform 11 supported code)_**


---

## Below are the resources that are launched by this module

* **_Launch Template_**


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-efs-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=master"

  providers = {
    "aws" = "aws.services"
  }

  name_prefix            = "ec2-lt-"
  description            = "${var.description}"
  ebs_optimized          = "${var.ebs_optimized}"
  image_id               = "${data.aws_ami.ami_ecs_node.id}"
  monitoring             = "${var.monitoring}"
  common_tags            = "${var.common_tags}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  user_data              = "${base64encode("${data.template_file.template_data.rendered}")}"
  iam_instance_profile   = [{
    name = "${var.instance_profile_name}"
  }]
  block_device_mappings = "${var.block_device_mappings}"
  tag_specifications    = [
    {
      resource_type = "instance"
      tags          = "${merge(var.common_tags, map("Name", "${var.source_market_name}-container-services-ecs-shared-services-node-ec2",))}"
    },
    {
      resource_type = "volume"
      tags          = "${merge(var.common_tags, map("Name", "${var.source_market_name}-container-services-ecs-shared-services-node-volume",))}"
    }
  ]


}
```

---



## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|         **_Variable_**          |        **_Description_**            |   **_Type_**   |
|---------------------------------|-------------------------------------|----------------|
| name_prefix                     | Creates a unique name               | string         |
| description                     | Description of the launch template  | string         |
| image_id                        | The AMI id                          | string         |
| ebs_optimized                   | EBS Check                           | string         |
| block_device_mappings           | Root Volume                         | list of map    |
| iam_instance_profile            | Instance Role ARN                   | list of map    |
| vpc_security_group_ids          | Security group ids                  | list           |
| monitoring                      | Configure Monitoring                | string         |
| user_data                       | The Base64-encoded user data        | string         |
| tag_specifications              | The tags to apply to the resources  | list of map    |
| common_tags                     | Common Tags                         | map            |





## Outputs

* **_latest\_version_**
* **_id_**
* **_arn_**




### Usage
In order for the variables to be accessed on module level please use the syntax below:

```tf
module.<module_name>.<output_variable_name>
```

If an output variable needs to be exposed on root level in order to be accessed through terraform state file follow the steps below:

- Include the syntax above in the network layer output terraform file.
- Add the code snippet below to the variables/global_variables file.

```tf
data "terraform_remote_state" "<module_name>" {
  backend = "s3"

  config {
    bucket = <bucket_name> (i.e. "s3-webstack-terraform-state")
    key    = <state_file_relative_path> (i.e. "env:/${terraform.workspace}/4_Networking/terraform.tfstate")
    region = <bucket_region> (i.e. "eu-central-1")
  }
}
```

- The output variable is able to be accessed through terraform state file using the syntax below:

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```

## Authors
Module maintained by Module maintained by the - **_Nitin Das_**
