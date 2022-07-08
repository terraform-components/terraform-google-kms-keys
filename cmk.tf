resource "google_kms_key_ring" "this" {
  count    = var.kms_key_ring_id != null ? 0 : 1
  name     = "${var.key_ring_name}-${var.location}"
  location = var.location
}

resource "google_kms_crypto_key" "this" {
  for_each        = toset(var.keys)
  name            = "${each.key}-${var.location}"
  key_ring        = var.kms_key_ring_id != null ? var.kms_key_ring_id : join("", google_kms_key_ring.this.*.id)
  purpose         = var.purpose
  rotation_period = var.rotation_period

  version_template {
    protection_level = var.protection_level
    algorithm        = var.algorithm
  }

  labels = var.labels
}

