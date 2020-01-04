# Terraform Module Name: terraform-module-launch-template


## General

This module may be used to create **_Launch Template_** resources in AWS cloud provider..

---


## Prerequisites

This module needs **_Terraform 0.11.14_** or newer.
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
module "<layer>-launch-template-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-launch-template.git?ref=terraform-11/master"

  providers = {
    "aws" = "aws.services"
  }

  name_prefix            = "ec2-lt-"
  description            = "${var.description}"
  ebs_optimized          = "${var.ebs_optimized}"
  image_id               = "${data.aws_ami.ami_node.id}"
  monitoring             = "${var.monitoring}"
  common_tags            = "${var.common_tags}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  user_data              = "${base64encode("${data.template_file.template_data.rendered}")}"
  key_name               = "${var.key_name}"
  iam_instance_profile   = [{
    name = "${var.instance_profile_name}"
  }]
  block_device_mappings = "${var.block_device_mappings}"
  tag_specifications    = [
    {
      resource_type = "instance"
      tags          = "${merge(var.common_tags, map("Name", "ec2-instance",))}"
    },
    {
      resource_type = "volume"
      tags          = "${merge(var.common_tags, map("Name", "ec2-instance-volume",))}"
    }
  ]
}
```

---



## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:

|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name\_prefix_** | Creates a unique name | string | **_Required_** |
| **_description_** | Description of the launch template | string | **_Required_** |
| **_image\_id_** | The AMI id | string | **_Required_** |
| **_ebs\_optimized_** | EBS Check | string | **_Required_** |
| **_block\_device\_mappings_** | Root Volume | list of map | **_Required_** |
| **_iam\_instance\_profile_** | Instance Role ARN | list of map | **_Required_** |
| **_vpc\_security\_group\_ids_** | Security group ids | list | **_Required_** |
| **_monitoring_** | Configure Monitoring | string | **_Required_** |
| **_user\_data_** | The Base64-encoded user data | string | **_Required_** |
| **_tag\_specifications_** | The tags to apply to the resources  | list of map | **_Required_** |
| **_common\_tags_** | Common Tags | map | **_Required_** |
| **_key\_name_** | The key name to use | string | **_Required_** |





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
