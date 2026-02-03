# ListOrganizationInvitesResponse

ListOrganizationInvitesResponse contains a page of invitations.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.OrganizationInvite](../models/organizationinvite.md)]                                         | :heavy_minus_sign:                                                                                         | List of invitations.                                                                                       |
| `pagination`                                                                                               | [models.Pagination](../models/pagination.md)                                                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |