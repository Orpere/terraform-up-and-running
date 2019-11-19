output "address" {
  value       = aws_db_instance.stage-orlando.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = aws_db_instance.stage-orlando.port
  description = "The port the database is listening on"
}