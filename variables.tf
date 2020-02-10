###########
# Variables
###########

variable "idb_url" {
  type = string
}

variable "database_schema" {
  type = list(object({
    db_name = string
    db_policies = list(object(
      {
        name     = string
        duration = string
        default  = bool
    }))
  }))
}
