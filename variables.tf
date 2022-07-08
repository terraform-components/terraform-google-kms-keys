variable "kms_key_ring_id" {
  type        = string
  description = <<-EOT
    
    A key ring is for organizing your keys. In simple projects, you should not need more than one key ring usually. Key rings can not be destroyed, therefore you should be rather careful with this. 

    If you do not supply a key ring, one will be created for you
    
    See also: https://cloud.google.com/kms/docs/resource-hierarchy#key_rings"
    EOT
  default     = null
}

variable "key_ring_name" {
  type    = string
  default = "main"
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
  description = "Service identities for the key."
}

variable "labels" {
  type        = map(string)
  description = "Labels for the key."
}
