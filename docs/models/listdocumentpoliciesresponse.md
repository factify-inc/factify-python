# ListDocumentPoliciesResponse

ListDocumentPoliciesResponse contains a page of policy attachments.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.DocumentPolicy](../models/documentpolicy.md)]                                                 | :heavy_minus_sign:                                                                                         | List of policy attachments.                                                                                |
| `pagination`                                                                                               | [models.Pagination](../models/pagination.md)                                                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |