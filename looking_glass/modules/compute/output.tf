output "instance_id" {
  value = aws_instance.nginx.id
}

output "instance_public_ip" {
  value = aws_instance.nginx.public_ip
}

output "instance_private_ip" {
  value = aws_instance.nginx.private_ip
}

output "key_name" {
  value = aws_key_pair.generated_key.key_name
}