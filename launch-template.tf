resource "aws_launch_template" "launch_template" {
  name_prefix   = var.name_prefix
  description   = var.description
  image_id      = var.image_id
  ebs_optimized = var.ebs_optimized

  dynamic "block_device_mappings" {
    for_each = length(var.block_device_mappings) == 0 ? [] : var.block_device_mappings
    content {
      device_name  = lookup(block_device_mappings.value, "device_name", null)
      no_device    = lookup(block_device_mappings.value, "no_device", null)
      virtual_name = lookup(block_device_mappings.value, "virtual_name", null)

      dynamic "ebs" {
        for_each = [lookup(block_device_mappings.value, "ebs", [])]
        content {
          delete_on_termination = lookup(ebs.value, "delete_on_termination", null)
          encrypted             = lookup(ebs.value, "encrypted", null)
          iops                  = lookup(ebs.value, "iops", null)
          kms_key_id            = lookup(ebs.value, "kms_key_id", null)
          snapshot_id           = lookup(ebs.value, "snapshot_id", null)
          volume_size           = lookup(ebs.value, "volume_size", null)
          volume_type           = lookup(ebs.value, "volume_type", null)
        }
      }
    }
  }

  dynamic "iam_instance_profile" {
    for_each = length(keys(var.iam_instance_profile)) == 0 ? [] : [var.iam_instance_profile]
    content {
      arn  = lookup(iam_instance_profile.value, "arn", null)
      name = lookup(iam_instance_profile.value, "name", null)
    }
  }

  dynamic "monitoring" {
    for_each = length(keys(var.monitoring)) == 0 ? [] : [var.monitoring]
    content {
      enabled = lookup(monitoring.value, "enabled", null)
    }
  }

  dynamic "tag_specifications" {
    for_each = var.tag_specifications
    content {
      resource_type = lookup(tag_specifications.value, "resource_type", null)
      tags          = lookup(tag_specifications.value, "tags", null)
    }
  }
  vpc_security_group_ids = var.vpc_security_group_ids

  user_data = var.user_data
  tags      = var.tags
  key_name  = var.key_name
}

