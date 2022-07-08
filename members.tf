resource "google_project_service_identity" "this" {
  for_each = toset(distinct(flatten([for _, v in var.service_identities : v])))
  provider = google-beta
  service  = each.key
}

resource "google_kms_crypto_key_iam_binding" "this" {
  for_each      = var.service_identities
  crypto_key_id = google_kms_crypto_key.this[each.key].id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members       = [for service in toset(each.value) : "serviceAccount:${google_project_service_identity.this[service].email}"]

  depends_on = [
    google_project_service_identity.this
  ]
}
