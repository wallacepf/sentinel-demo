output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.demo_server.public_ip
}

output "elastic_ip" {
  value = aws_eip.default.public_ip
}
