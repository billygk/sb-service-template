module "bastion_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.8.0"

  name        = "bastion-eks-sg"
  description = "Security group for bastion eks cluster"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "ssh-tcp", "http-80-tcp"]
  egress_rules        = ["all-all"]
}


data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami               = data.aws_ami.ubuntu.id
  availability_zone = module.vpc.azs[0]
  subnet_id         = module.vpc.public_subnets[0]
  instance_type     = "t2.small"
  key_name          = "billy-key"
  disable_api_termination = true
  vpc_security_group_ids = [module.bastion_security_group.security_group_id]

  associate_public_ip_address = true
  source_dest_check           = false


  root_block_device {
    volume_size = "40"
    volume_type = "gp2"
  }

  tags = {
    Name = "dev-bastion"
  }
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = {
    Name = "dev-bastion-ip"
  }
}

resource "aws_route53_record" "bastion-eks" {
  zone_id = data.aws_route53_zone.dev.zone_id
  name    = "${var.bastion_hostname}.${data.aws_route53_zone.dev.name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.bastion-eks.public_ip]
}