resource "aws_secretsmanager_secret" "infraview_store" {
  name        = "infraview/secret"
  description = "Secret store for InfraView server data"
}
