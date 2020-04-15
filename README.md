# _Terraform Module : terraform-module-launch-template_
_Terraform Module for_ **_AWS Launch Template_**

<!--BEGIN STABILITY BANNER-->
---

![_Code : Stable_](https://img.shields.io/badge/Code-Stable-brightgreen?style=for-the-badge&logo=github)

> **_This is a stable example. It should successfully build out of the box_**
>
> _This examples does is built on Construct Libraries marked "Stable" and does not have any infrastructure prerequisites to build._

---
<!--END STABILITY BANNER-->

## _General_

_This module may be used to create_ **_Launch Template_** _resources in AWS cloud provider......_

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.19_** _or newer._
_You can download the latest Terraform version from_ [here](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---

## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

* **_Launch Template_**



---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "launch_template" {
  source = "git::https://github.com/nitinda/terraform-module-aws-launch-template.git?ref=master"

  providers = {
    aws = aws.services
  }

  name_prefix            = "lt-"
  description            = "EC2 Launch Template"
  ebs_optimized          = true
  image_id               = var.image_id
  monitoring             = { enabled = false }
  tags                   = var.tags
  vpc_security_group_ids = [ var.vpc_security_group_ids ]
  user_data              = base64encode("${data.template_file.template_data.rendered}")
  iam_instance_profile   = { name = module.iam_instance_profile_ec2.name }
  block_device_mappings = []
  tag_specifications    = [
    {
      resource_type = "instance"
      tags          = merge(var.common_tags, map("Name", "demo-ec2-instance",))
    },
    {
      resource_type = "volume"
      tags          = merge(var.common_tags, map("Name", "demo-ec2-instance-volume",))
    }
  ]
}
```

---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** | **_Default Value_** |
|:----|:----|-----:|-----:|-----:|
| **_name_** | _The name of the launch template_ | _string_ | **_Optional_** | **_null_** |
| **_name\_prefix_** | _Creates a unique name beginning <br/> with the specified prefix_ | _string_ | **_Optional_** | **_null_** |
| **_description_** | _Description of the launch template_ | _string_ | **_Optional_** | **_null_** |
| **_block\_device\_mappings_** | _Specify volumes to attach to the instance besides <br/> the volumes specified by the AMI_ | _any_ | **_Optional_** | **_[]_** |
| **_capacity\_reservation\_specification_** | _Targeting for EC2 capacity reservations_ | _any_ | **_Optional_** | **_[]_** |
| **_cpu\_options_** | _The CPU options for the instance | _any_ | **_Optional_** | **_[]_** |
| **_credit\_specification_** | _Customize the credit specification of the instance_ | _any_ | **_Optional_** | **_[]_** |
| **_disable\_api\_termination_** | _If true, enables EC2 Instance <br/> Termination Protection_ | _boolean_ | **_Optional_** | **_false_** |
| **_ebs\_optimized_** | _If true, the launched instance will be EBS Optimized_ | _boolean_ | **_Optional_** | **_[]_** |
| **_elastic\_gpu\_specifications_** | _The elastic GPU to attach to the instance_ | _boolean_ | **_Optional_** | **_[]_** |
| **_elastic\_inference\_accelerator_** | _Configuration block containing an <br/>Elastic Inference Accelerator to attach to <br/>the instance_ | _any_ | **_Optional_** | **_[]_** |
| **_iam\_instance\_profile_** | _The IAM Instance Profile to <br/> launch the instance with_ | _any_ | **_Optional_** | **_[]_** |
| **_image\_id_** | _The AMI id_ | _string_ | **_Required_** |
| **_instance\_initiated\_shutdown\_behavior_** | _Shutdown behavior for the instance_ | _string_ | **_Optional_** | **_stop_** |
| **_instance\_market\_options_** | _The market (purchasing) option for the instance_ | _any_ | **_Optional_** | **_[]_** |
| **_instance\_type_** | _The type of the instance_ | _string_ | **_Optional_** | **_null_** |
| **_kernel\_id_** | _The kernel ID_ | _string_ | **_Optional_** | **_null_** |
| **_key\_name_** | _The key name to use for the instance_ | _string_ | **_Optional_** | **_null_** |
| **_license\_specification_** | _A list of license specifications to associate with_ | _any_ | **_Optional_** | **_[]_** |
| **_metadata\_options_** | _Customize the metadata options for the instance_ | _any_ | **_Optional_** | **_[]_** |
| **_monitoring_** | _The monitoring option for the instance. <br/> See Monitoring below for more details_ | _any_ | **_Optional_** | **_[]_** |
| **_network\_interfaces_** | _Customize network interfaces to be <br/> attached at instance boot time_ | _any_ | **_Optional_** | **_[]_** |
| **_placement_** | _The placement of the instance_ | _any_ | **_Optional_** | **_[]_** |
| **_ram\_disk\_id_** | _The ID of the RAM disk_ | _string_ | **_Optional_** | **_null_** |
| **_security\_group\_names_** | _A list of security group names to associate with_ | _any_ | **_Optional_** | **_[]_** |
| **_vpc\_security\_group\_ids_** | _A list of security group IDs to associate with_ | _list(string)_ | **_Optional_** | **_[]_** |
| **_tag\_specifications_** | _The tags to apply to the resources during launch_  | _any_ | **_Optional_** | **_[]_** |
| **_tags_** | _A mapping of tags to assign to the launch template_ | _map(string)_ | **_Optional_** | **_{}_** |
| **_user\_data_** | _The Base64-encoded user data <br/> to provide when launching the instance_ | _string_ | **_Optional_** | **_[]_** |
| **_hibernation\_options_** | _The hibernation options for the instance_ | _any_ | **_Optional_** | **_[]_** |


---

## _Outputs_

### _General_

_This module has the following outputs:_

* **_latest\_version_**
* **_id_**
* **_arn_**

---


### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>
```

---

## _Authors_

_Module maintained by Module maintained by the -_ **_Nitin Das_**
