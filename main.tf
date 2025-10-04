resource "google_service_account" "default" {
  account_id   = var.service_account_name
  display_name = var.service_account_name
  create_ignore_already_exists = true
  project = var.project_id
  disabled = var.disable_service_account
  description = var.description 
}

resource "google_service_account_iam_binding" "default" {
  for_each = var.assign_role_iam_binding ? var.role_member_conditions : {}  
  service_account_id = google_service_account.default.name
  role               = each.value.role

  members = each.value.members
  dynamic "condition" {
    for_each = each.value.conditions
    content {
      title       = condition.value.title
      description = condition.value.description
      expression  = condition.value.expression
    }
  }
  depends_on = [
    google_service_account.default
  ]  
}

resource "google_project_iam_binding" "service_account_roles" {
  count    = var.project_level_role_iam_binding ? length(var.project_level_roles) : 0
  project  = var.project_id
  role     = var.project_level_roles[count.index]

  members = [
    "serviceAccount:${google_service_account.default.email}"
  ]
  depends_on = [
    google_service_account.default
  ]
}
