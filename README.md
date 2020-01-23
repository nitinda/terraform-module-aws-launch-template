# _Terraform Module : terraform-module-launch-template_


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
  source = "git::https://github.com/nitinda/terraform-module-aws-launch-template.git?ref=terraform-12/master"

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


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name\_prefix_** | Creates a unique name | _string_ | **_Required_** |
| **_description_** | Description of the launch template | _string_ | **_Required_** |
| **_image\_id_** | The AMI id | _string_ | **_Required_** |
| **_ebs\_optimized_** | EBS Check | _string_ | **_Required_** |
| **_block\_device\_mappings_** | Root Volume | _any_ | **_Optional_** |
| **_iam\_instance\_profile_** | Instance Role ARN | _map(string)_ | **_Required_** |
| **_vpc\_security\_group\_ids_** | Security group ids | _list(string)_ | **_Required_** |
| **_monitoring_** | Configure Monitoring | _map(string)_ | **_Required_** |
| **_user\_data_** | The Base64-encoded user data | _string_ | **_Optional_** |
| **_tag\_specifications_** | The tags to apply to the resources  | _any_ | **_Required_** |
| **_tags_** | Common Tags | _map(string)_ | **_Required_** |
| **_key\_name_** | The key name to use | _string_ | **_Optional_** |


---

## _Outputs_

* **_latest\_version_**
* **_id_**
* **_arn_**



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
