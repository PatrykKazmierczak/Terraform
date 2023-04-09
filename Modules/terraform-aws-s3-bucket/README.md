Complete S3 bucket with most of supported features enabled
Configuration in this directory creates S3 bucket which demos such capabilities:

static web-site hosting
access logging (for S3, ELB and ALB/NLB)
versioning
CORS
lifecycle rules
server-side encryption
object locking
grants (required for CloudFront logs)
Please check S3 replication example to see Cross-Region Replication (CRR) supported by this module.

Usage
To run this example you need to execute:

$ terraform init
$ terraform plan
$ terraform apply
Note that this example may create resources which cost money. Run terraform destroy when you don't need these resources.

Requirements
Name	Version
terraform	>= 0.13.1
aws	>= 4.9
random	>= 2.0
Providers
Name	Version
aws	>= 4.9
random	>= 2.0
Modules
Name	Source	Version
cloudfront_log_bucket	../../	n/a
log_bucket	../../	n/a
s3_bucket	../../	n/a
Resources
Name	Type
aws_iam_role.this	resource
aws_kms_key.objects	resource
random_pet.this	resource
aws_caller_identity.current	data source
aws_canonical_user_id.current	data source
aws_cloudfront_log_delivery_canonical_user_id.cloudfront	data source
aws_iam_policy_document.bucket_policy	data source
Inputs
No inputs.

Outputs
Name	Description
s3_bucket_arn	The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.
s3_bucket_bucket_domain_name	The bucket domain name. Will be of format bucketname.s3.amazonaws.com.
s3_bucket_bucket_regional_domain_name	The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL.
s3_bucket_hosted_zone_id	The Route 53 Hosted Zone ID for this bucket's region.
s3_bucket_id	The name of the bucket.
s3_bucket_region	The AWS region this bucket resides in.
s3_bucket_website_domain	The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records.
s3_bucket_website_endpoint	The website endpoint, if the bucket is configured with a website. If not, this will be an empty string.