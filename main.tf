########
# Locals
########

locals {
  idb_databases_count = length(var.database_schema)
}

###########
# Resources
###########
resource "influxdb_database" "idb_databases_schema" {
  count = local.idb_databases_count
  name  = lookup(element(var.database_schema, count.index), "db_name")

  dynamic "retention_policies" {
    for_each = [for p in lookup(element(var.database_schema, count.index), "db_policies") : {
      name     = p.name
      duration = p.duration
      default  = p.default
    }]

    content {
      name     = retention_policies.value.name
      duration = retention_policies.value.duration
      default  = retention_policies.value.default
    }
  }
}
