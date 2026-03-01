# ListOrganizationMembersResponse

ListOrganizationMembersResponse contains a page of organization members.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.OrganizationMember](../models/organizationmember.md)]                                         | :heavy_minus_sign:                                                                                         | List of organization members.                                                                              |
| `pagination`                                                                                               | [models.Pagination](../models/pagination.md)                                                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |