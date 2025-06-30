variable "ami_id" { 
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "vpc_id" {
  description = "VPC ID where the instance will be launched"
  type        = string 
  
}


variable "public_subnet_id" {
  description = "Public subnet ID for the EC2 instance"
  type        = string
}

variable "user_data_file" {
  type    = string
  default = null
}