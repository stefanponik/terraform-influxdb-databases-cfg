###########
# Variables
###########

variable "idb_url" {
  type = string
}

variable "idb_username" {
  type    = string
  default = ""
}

variable "idb_password" {
  type    = string
  default = ""
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
