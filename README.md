# terraform-influxdb-databases-cfg

# InfluxDB Terraform Module

Module provide programmatic and state aware way to manage InfluxDB databases and policies for InfluxDB OSS running on any platform

# Terraform Requirements 

    terraform {
      required_version = ">= 0.12.0"

      required_providers {
        influxdb = ">= 1.3"
      }
    }

# Terraform module main.tf

    module "grf-datasources-cfg" {
      source          = "xxxxx"
      idb_url         = var.idb_url
      database_schema = var.database_schema
    }

# Terraform .tfvars
Example Variables sample for configuration

    idb_url = "http://localhost:8086"

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
          {
            name     = "dev-test-01"
            duration = "52w"
            default  = false
          },
        ]
      },
    ]

# Gotchas 
InfluxDB creates _internal database if you enable monitoring metric in InfluxDB config in default setting.
By default its using "monitor" policy name and settings are in above example. 

- I found it that define it that way and run terraform apply first will create correct state and wont conflict with existing _internal database and policy 
- Then you can mod duration or other attributes as desired and run terraform apply that will modify it correctly. 
- InfluxDB provider handles it in that way correctly. 
- InfluxDB provider does not provide import existing databases to terraform state file. 

# Future Work 
- Extend role to support all 

## License

MIT / BSD

# Author Information
Created on January 2020 by Stefan Ponik