resource "aws_s3_bucket" "buck1" {
for_each =toset(var.abc)
bucket = each.value
}
variable "abc" {
type = list(string)
default = ["sydney.devop.1", "sydney.devop.2"]
}

