output "s3_bucket" {
  value       = [for x in module.s3_bucket : x]
  description = "The name and socket for s3_bucket"
}