resource "aws_secretsmanager_secret" "infraview_store" {
  name        = "infraview/secret_store"
  description = "Secret store for InfraView server data"
}
