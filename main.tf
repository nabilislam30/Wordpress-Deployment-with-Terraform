# VPC
module "vpc" {
  source = "./modules/vpc"
  my_ip  = var.my_ip
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id

  user_data = file("${path.module}/user_data.sh")

}