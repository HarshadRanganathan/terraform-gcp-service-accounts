variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "region" {
  description = "The region in which to create resources."
  type        = string
  default     = "us-central1"
}

variable "disable_service_account" {
  description = "Disable the service account"
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the service account"
  type        = string  
}

variable "service_account_name" {
  description = "The name of the service account"
  type        = string  
}

variable "assign_role_iam_binding" {
  description = "Assign the role to the members"
  type        = bool
  default     = false
}

variable "role_member_conditions" {
  type = map(object({
    role       = string
    members    = list(string)
    conditions = list(object({
      title       = string
      description = string
      expression  = string
    }))
  }))
  default =  {}
  }
////////////////////////////////// Example:{
////////////////////////////////// Example:    "role1" = {
////////////////////////////////// Example:      role    = "roles/storage.admin"
////////////////////////////////// Example:      members = ["user:alice@example.com", "user:bob@example.com"]
////////////////////////////////// Example:      conditions = [
////////////////////////////////// Example:        {
////////////////////////////////// Example:          title       = "Condition1"
////////////////////////////////// Example:          description = "Description1"
////////////////////////////////// Example:          expression  = "expression1"
////////////////////////////////// Example:        }
////////////////////////////////// Example:      ]
////////////////////////////////// Example:    }
////////////////////////////////// Example:    "role2" = {
////////////////////////////////// Example:      role    = "roles/storage.viewer"
////////////////////////////////// Example:      members = ["user:charlie@example.com"]
////////////////////////////////// Example:      conditions = [
////////////////////////////////// Example:        {
////////////////////////////////// Example:          title       = "Condition2"
////////////////////////////////// Example:          description = "Description2"
////////////////////////////////// Example:          expression  = "expression2"
////////////////////////////////// Example:        }
////////////////////////////////// Example:      ]
////////////////////////////////// Example:    }
////////////////////////////////// Example:}

variable "project_level_role_iam_binding" {
  description = "Assign the role to the service account"
  type        = bool
  default     = false
}

variable "project_level_roles" {
  description = "The roles to assign to the service account"
  type        = list(string)
  default     = []
}
