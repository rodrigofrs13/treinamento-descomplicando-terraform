output "public-ip-ec2"   {
    value = aws_instance.server.public_ip  
}

output "public-dns-ec2"   {
    value = aws_instance.server.public_dns
}