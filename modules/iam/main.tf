resource "google_organization_iam_binding" "bindings" {

  for_each = var.bindings

  org_id = var.organization_id

  role = each.key

  members = each.value
}
