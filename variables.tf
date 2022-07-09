variable "name_format" {
  type = object({
    name1 = string
    name2 = string
  })
  default = {
    name1 = "%s"
    name2 = "%s-%s"
  }
}

variable "name" {
  type = string
}

variable "kms_key_ring_id" {
  type        = string
  description = <<-EOT
    
    A key ring is for organizing your keys. In simple projects, you should not need more than one key ring usually. Key rings can not be destroyed, therefore you should be rather careful with this. 

    If you do not supply a key ring, one will be created for you
    
    See also: https://cloud.google.com/kms/docs/resource-hierarchy#key_rings"
    EOT
  default     = null
}

variable "location" {
  type        = string
  description = "Location of the key. Be aware that the resources using the key and the key location need to match. Resources in `global` also need a `global` key and same for `europe` or `europe-west3` etc."
}

variable "keys" {
  type        = list(string)
  description = "Name of your keys"
}

variable "service_identities" {
  type        = map(list(string))
  description = "Service identities for the keys. This is separate as it may not apply to every key."
}

variable "labels" {
  type        = map(string)
  description = "Labels for the keys"
}

variable "protection_level" {
  type        = string
  default     = "SOFTWARE"
  description = <<-EOT
    Default protection level.

    **SOFTWARE** 
    
    **HSM** 
    
    **EXTERNAL**
    EOT
}

variable "algorithm" {
  type        = string
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
  description = "See https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm"
}

variable "purpose" {
  type        = string
  default     = "ENCRYPT_DECRYPT"
  description = "See https://cloud.google.com/kms/docs/reference/rest/v1/projects.locations.keyRings.cryptoKeys#CryptoKeyPurpose"
}

variable "rotation_period" {
  type        = string
  default     = "31536000s"
  description = "Default is 1 year (31536000s)"
}
