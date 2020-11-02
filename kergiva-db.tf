resource "random_password" "kergiva_api_db_user_password" {
  length = 16
  special = true
  override_special = "_%@"
}
resource "mysql_user" "kergiva_api_db_user" {
  user = local.instance_name
  host = "*"
  plaintext_password = random_password.kergiva_api_db_user_password.result
}
resource "mysql_database" "kergiva_api_db" {
  name = "${local.instance_name}-data"
}
resource "mysql_grant" "kergiva_api_db_user_grant" {
  user       = mysql_user.kergiva_api_db_user.user
  host       = "*"
  database   = mysql_database.kergiva_api_db
  privileges = ["ALL"]
}