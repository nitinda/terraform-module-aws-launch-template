output "arn" {
  value = "${aws_launch_template.launch_template.arn}"
}

output "id" {
  value = "${aws_launch_template.launch_template.id}"
}

output "latest_version" {
  value = "${aws_launch_template.launch_template.latest_version}"
}