resource "aws_instance" "nginx" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id  
  key_name      = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address= true


  user_data = var.user_data_file != null ? file(var.user_data_file) : null
  
  tags = {
    Name = "dev_test"    
  }
}




resource "aws_security_group" "web_sg" {
  name        = "Dev-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}