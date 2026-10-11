resource "google_cloud_run_service_iam_member" "cloud_run_service_iam_members" {
  for_each = var.cloud_run_service_iam_members

  member   = each.value.member
  role     = each.value.role
  service  = each.value.service
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

