## Launch Template
variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "description" {
  description = "Description of the launch template."
}

variable "image_id" {
  description = "The AMI from which to launch the instance."
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
}

variable "block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI."
  type        = "list"
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with."
  type        = "list"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with."
  type        = "list"
}

variable "monitoring" {
  description = "The monitoring option for the instance. See Monitoring below for more details."
  type        = "list"
}

variable "user_data" {
  description = "The Base64-encoded user data to provide when launching the instance."
}

variable "tag_specifications" {
  description = "The tags to apply to the resources during launch."
  type        = "list"
}

## Tags
variable common_tags {
  description = "Resources Tags"
  type        = "map"
}