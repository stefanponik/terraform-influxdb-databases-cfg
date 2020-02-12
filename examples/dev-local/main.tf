###########
# Providers 
###########

provider "influxdb" {
  url = var.idb_url
}

provider "influxdb" {
  alias    = "auth"
  url      = var.idb_url
  username = var.idb_username
  password = var.idb_password
}

#########
# Modules
#########

#module "terraform-influxdb-databases-cfg" {
#  source          = "github.com/stefanponik/terraform-influxdb-databases-cfg.git?ref=v0.0.1"
#  database_schema = var.database_schema
#  providers = {
#    influxdb = influxdb
#  }
#}
