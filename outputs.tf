output "london-publicIP" {
    value = aws_instance.example-london.public_ip
}
output "london-publicDNS" {
    value = aws_instance.example-london.public_dns
}

output "paris-publicIP" {
  value = aws_instance.example-paris.public_ip
}
output "paris-publicDNS" {
    value = aws_instance.example-paris.public_dns
}

output "ireland-publicIP" {
    value = aws_instance.example-ireland.public_ip 
}
output "ireland-publicDNS" {
    value = aws_instance.example-ireland.public_dns
}