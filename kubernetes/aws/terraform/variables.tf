variable "domain_name" {
  type        = string
  default     = "domain.dev"
}

variable "region" {
  type = string
  default = "us-east-2"
}

variable "cluster_name" {
  type = string
  default = "dev-eks"
}

variable "vpc_name" {
  type = string
  default = "dev-tehub"
}

resource "aws_key_pair" "billy" {
  key_name   = "billy-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC64aHiQyGxUERTIU8es2x0bOSJs++q7AQN7WRwufXaKdBq6M0jCZgGPb/TwTmxnoWCHj01kLH8XwT4wU0ytWQNV295FruTUtrZ2oy0WVKlYD3W5qJOE+Xu5X8jui2fWOJn9HAKExa2kSm0gDIsVGWPxjALtTmaTM7MTZVszseqjfSDMju6kEG63vIqSc7EUvCbF2gygvMtpb8Ll3ajx/m2mvSREgbPB1Bx+456Mdwfx47AyIpd05uaGIcwkMrgUblroQDqF3jw7ScbXDkZbg40IblNzALzrnligdMvew42PlG8uebfjvdKOorx1Nzb9yd8m5LnFvASS6NJgVHExh0pPrTKaotQi2x3qc5Xfuihr0eVfeC4eFlqwNfBpTyIe5qH0IOBSrd61+yhssKRoiLyFVJW87hcSGtjQEPr1lL5o1y6U0Z/iFvlYDzcz88LuPoiUVulOpbYpuLSeVdJTdqxkovQ8BqUpHHunQuD4tV1MqXvMLWiZBglvmUuGdANcv45iqxFIGK7oInugDOaz5YXVnbAEajvoGOdx6t6MpJ8uh1kTi5Ka4UsBoT0arimF2ajopfBeTl3Awidflv2GeoiJnUfvbgVnBEVNkCASsd8X5SkEgRjQelwpm1IJKyejKtFdFvb5eMyyn0w70TC6X+EXwkJkZuQrNGGt+mrSi41iw== gkrepper@tenantevaluation.com"
}

