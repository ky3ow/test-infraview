resource "aws_secretsmanager_secret" "infraview_store" {
  name        = "infraview/break-everything"
  description = "Secret store for InfraView server data"
}
