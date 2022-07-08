# terraform-google-kms-keys
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_google"></a> [google](#provider\_google)

- <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [google-beta_google_project_service_identity.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_project_service_identity) (resource)
- [google_kms_crypto_key.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) (resource)
- [google_kms_crypto_key_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_binding) (resource)
- [google_kms_key_ring.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_keys"></a> [keys](#input\_keys)

Description: Name of your keys

Type: `list(string)`

### <a name="input_labels"></a> [labels](#input\_labels)

Description: Labels for the key.

Type: `map(string)`

### <a name="input_location"></a> [location](#input\_location)

Description: Location of the key. Be aware that the resources using the key and the key location need to match. Resources in `global` also need a `global` key and same for `europe` or `europe-west3` etc.

Type: `string`

### <a name="input_service_identities"></a> [service\_identities](#input\_service\_identities)

Description: Service identities for the key.

Type: `map(list(string))`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_key_ring_name"></a> [key\_ring\_name](#input\_key\_ring\_name)

Description: n/a

Type: `string`

Default: `"main"`

### <a name="input_kms_key_ring_id"></a> [kms\_key\_ring\_id](#input\_kms\_key\_ring\_id)

Description:     
A key ring is for organizing your keys. In simple projects, you should not need more than one key ring usually. Key rings can not be destroyed, therefore you should be rather careful with this.

If you do not supply a key ring, one will be created for you  

See also: https://cloud.google.com/kms/docs/resource-hierarchy#key_rings"

Type: `string`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_kms_key_ids"></a> [kms\_key\_ids](#output\_kms\_key\_ids)

Description: kms key ids
<!-- END_TF_DOCS -->