output "kms_key_ids" {
  value = {
    for k, v in google_kms_crypto_key.this :
    k => v.id
  }
  description = "kms key ids"
}


