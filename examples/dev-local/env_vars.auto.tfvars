###########
# Variables 
###########

idb_url = "http://localhost:8086"

idb_username = "admin"
idb_password = "Password1"

database_schema = [
  {
    db_name = "_internal"
    db_policies = [
      {
        name     = "monitor"
        duration = "1w"
        default  = true
      },
    ]
  },
  {
    db_name = "MetricStore"
    db_policies = [
      {
        name     = "dev-default"
        duration = "52w"
        default  = true
      },
      #      {
      #        name     = "dev-test-01"
      #        duration = "52w"
      #        default  = false
      #      },
    ]
  },
]
