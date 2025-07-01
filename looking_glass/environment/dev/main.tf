module "network" {
  source              = "../../modules/network"
  cidr_block          = "10.0.0.0/16"
}
module "compute" {
  source           = "../../modules/compute"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
  user_data_file   = ("${path.module}/install-nginx.sh")
}

#azza#
