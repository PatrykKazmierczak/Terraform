module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "aws-s3-bucket-pkaz-devops-1"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

resource "aws_s3_bucket" "aws_s3_bucket_1" {
  bucket = "aws-s3-bucket-pkaz-devops-1"

  tags = {
    Name        = "My bucket-1"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}



resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_1" {
  bucket = aws_s3_bucket.aws_s3_bucket_1.id

  policy = jsonencode({
    "Id": "Policy1681656626372",
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1681656625569",
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-1/*",
        "Principal": "*"
      }
    ]
  })
}

