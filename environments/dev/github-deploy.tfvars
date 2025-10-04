service_account_name = "github-deploy"
description = "Service account for GitHub Deployment"
project_id  = ""

assign_role_iam_binding = true
project_level_role_iam_binding = true

role_member_conditions = {
  "role1" = {
    role    = "roles/iam.workloadIdentityUser"
    members = ["principalSet://iam.googleapis.com/projects//locations/global/workloadIdentityPools/github/attribute.repository_owner/dev"]
    conditions = []
    }
}

project_level_roles = [
  "roles/iam.serviceAccountUser",
  "roles/artifactregistry.admin",
  "roles/cloudbuild.builds.editor",
  "roles/run.admin",
  "roles/storage.admin",
  "roles/container.developer",
  "roles/bigquery.jobUser"
]
