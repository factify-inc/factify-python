# ListAPIKeysResponse

ListApiKeysResponse contains a page of API keys.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.APIKey](../models/apikey.md)]                                                                 | :heavy_minus_sign:                                                                                         | List of API keys (secrets are never included).                                                             |
| `pagination`                                                                                               | [models.Pagination](../models/pagination.md)                                                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |