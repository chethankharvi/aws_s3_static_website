
output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.website_s3_bucket.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.website_s3_bucket.name
}

output "website_bucket_domain" {
  description = "Name (id) of the bucket"
  value       = module.website_s3_bucket.domain
}

output "website_bucket_endpoint" {
  description = "Name (id) of the bucket"
  value       = module.website_s3_bucket.endpoint
}
