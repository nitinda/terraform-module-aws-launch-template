## Launch Template
variable "name" {
  description = "The name of the launch template"
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  default     = null
}

variable "description" {
  description = "Description of the launch template"
  default     = null
}

variable "block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI."
  type        = any
  default     = {}
}

variable "capacity_reservation_specification" {
  description = "Targeting for EC2 capacity reservations"
  default     = []
  type        = any
}

variable "cpu_options" {
  description = "The CPU options for the instance"
  default     = []
  type        = any
}

variable "credit_specification" {
  description = "Customize the credit specification of the instance"
  default     = []
  type        = any
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
  type        = bool
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
  type        = bool
}

variable "elastic_gpu_specifications" {
  description = "The elastic GPU to attach to the instance"
  default     = []
  type        = any
}

variable "elastic_inference_accelerator" {
  description = "Configuration block containing an Elastic Inference Accelerator to attach to the instance"
  default     = []
  type        = any
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with."
  type        = map(string)
  default     = {}
}

variable "image_id" {
  description = "The AMI from which to launch the instance"
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance"
  default     = "stop"
}

variable "instance_market_options" {
  description = "The market (purchasing) option for the instance"
  default     = []
  type        = any
}

variable "instance_type" {
  description = "The type of the instance"
  default     = null
}

variable "kernel_id" {
  description = "The kernel ID"
  default     = null
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = null
}

variable "license_specification" {
  description = "A list of license specifications to associate with"
  default     = []
  type        = any
}

variable "metadata_options" {
  description = "Customize the metadata options for the instance"
  default     = []
  type        = any
}

variable "monitoring" {
  description = "The monitoring option for the instance. See Monitoring below for more details."
  type        = any
  default     = []
}

variable "network_interfaces" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = any
  default     = []
}

variable "placement" {
  description = "The placement of the instance"
  type        = any
  default     = []
}

variable "ram_disk_id" {
  description = "The ID of the RAM disk"
  default     = null
}

variable "security_group_names" {
  description = "A list of security group names to associate with"
  default     = []
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with."
  type        = list(string)
  default     = []
}

variable "tag_specifications" {
  description = "The tags to apply to the resources during launch"
  type        = any
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the launch template"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The Base64-encoded user data to provide when launching the instance."
  default     = null
}

variable "hibernation_options" {
  description = "The hibernation options for the instance"
  type        = any
  default     = []
}
