# FactifyAPIV1betaListDocumentsResponse

ListDocumentsResponse contains a page of documents.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.FactifyAPIV1betaDocument](../models/factifyapiv1betadocument.md)]                             | :heavy_minus_sign:                                                                                         | List of documents.                                                                                         |
| `pagination`                                                                                               | [models.FactifyAPIV1betaPagination](../models/factifyapiv1betapagination.md)                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |