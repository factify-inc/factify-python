# FactifyAPIV1betaListAPIKeysResponse

ListApiKeysResponse contains a page of API keys.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.FactifyAPIV1betaAPIKey](../models/factifyapiv1betaapikey.md)]                                 | :heavy_minus_sign:                                                                                         | List of API keys (secrets are never included).                                                             |
| `pagination`                                                                                               | [models.FactifyAPIV1betaPagination](../models/factifyapiv1betapagination.md)                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |