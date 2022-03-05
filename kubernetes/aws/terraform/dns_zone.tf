data "aws_route53_zone" "dev" {
  name = "${var.domain_name}."
}
