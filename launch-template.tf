resource "aws_launch_template" "launch_template" {
  name_prefix            = "${var.name_prefix}"
  description            = "${var.description}"
  image_id               = "${var.image_id}"
  ebs_optimized          = "${var.ebs_optimized}"
  block_device_mappings  = "${var.block_device_mappings}"
  iam_instance_profile   = ["${var.iam_instance_profile}"]
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  monitoring             = "${var.monitoring}"
  user_data              = "${var.user_data}"
  tag_specifications     = "${var.tag_specifications}"
  tags                   = "${var.common_tags}"
}