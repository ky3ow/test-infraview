resource "aws_secretsmanager_secret" "infraview_store" {
  name        = "infraview/demo_change"
  description = "Secret store for InfraView server data"
}
