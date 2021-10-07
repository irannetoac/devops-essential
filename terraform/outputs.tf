output "app_public_ip" {
    description = "Application public ipv4"
    value = aws_instance.app_server.public_ip
}

output "db_ip" {
    description = "Database ipv4 address"
    value = "${aws_db_instance.database.address}"
}

output "db_username" {
  description = "Database administrator username"
  value       = aws_db_instance.database.username
  sensitive   = true
}

output "db_password" {
  description = "Database administrator password"
  value       = aws_db_instance.database.password
  sensitive   = true
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.database.name
}

output "db_identifier" {
  description = "Database id"
  value       = aws_db_instance.database.identifier
}

https://stackoverflow.com/questions/40353666/how-to-pass-terraform-outputs-variables-into-ansible-as-vars-files
