# FactifyAPIV1betaListDocumentPoliciesResponse

ListDocumentPoliciesResponse contains a page of policy attachments.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.FactifyAPIV1betaDocumentPolicy](../models/factifyapiv1betadocumentpolicy.md)]                 | :heavy_minus_sign:                                                                                         | List of policy attachments.                                                                                |
| `pagination`                                                                                               | [models.FactifyAPIV1betaPagination](../models/factifyapiv1betapagination.md)                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |