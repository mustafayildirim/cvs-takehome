resource "aws_s3_bucket" "cvs_dev" {
    bucket = "terraform.infra"
    acl = "private"
}

resource "aws_s3_bucket_public_access_block" "cvs_dev" {
    bucket = aws_s3_bucket.cvs_dev.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}
