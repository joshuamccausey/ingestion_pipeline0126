# Specifies the geographic location for AZ resource deployment.
variable "az_region" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "northcentralus"
}

# The unique identifier for the blob  bucket where raw data will be stored.
variable "bucket_name" {
  description = "Name of the blob  bucket"
  type        = string
  default     = "destoragebucket01"
}

# Defines the logical grouping for metadata in AZ.
# This allows tools like Athena to query the blob data using SQL.
variable "dataset_name" {
  description = "Glue Catalog database name (logical dataset for Athena/Glue)"
  type        = string
  default     = "nytaxidatabase"
}
