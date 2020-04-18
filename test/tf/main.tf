###########
# Providers 
###########

provider "influxdb" {
  url = var.idb_url
}

#########
# Modules
#########

module "terraform-influxdb-databases-cfg" {
  source          = "github.com/stefanponik/terraform-influxdb-databases-cfg.git?ref=v0.0.2"
  database_schema = var.database_schema
  providers = {
    influxdb = influxdb
  }
}
