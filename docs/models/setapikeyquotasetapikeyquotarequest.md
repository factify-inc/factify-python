# SetAPIKeyQuotaSetAPIKeyQuotaRequest

SetAPIKeyQuotaRequest creates or updates a per-key quota.


## Fields

| Field                                                                       | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `limit`                                                                     | *OptionalNullable[int]*                                                     | :heavy_minus_sign:                                                          | The limit for this key. Must be > 0.                                        |                                                                             |
| `organization_id`                                                           | *OptionalNullable[str]*                                                     | :heavy_minus_sign:                                                          | Optional: organization ID. If not provided, uses the caller's organization. | org_01h2xcejqtf2nbrexx3vqjhp41                                              |