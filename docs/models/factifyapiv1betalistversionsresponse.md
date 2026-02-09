# FactifyAPIV1betaListVersionsResponse

ListVersionsResponse contains a page of versions.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.FactifyAPIV1betaVersion](../models/factifyapiv1betaversion.md)]                               | :heavy_minus_sign:                                                                                         | List of versions.                                                                                          |
| `pagination`                                                                                               | [models.FactifyAPIV1betaPagination](../models/factifyapiv1betapagination.md)                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |