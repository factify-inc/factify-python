# ListOrganizationsResponse

ListOrganizationsResponse contains a page of organizations.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.Organization](../models/organization.md)]                                                     | :heavy_minus_sign:                                                                                         | List of organizations.                                                                                     |
| `pagination`                                                                                               | [models.Pagination](../models/pagination.md)                                                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |