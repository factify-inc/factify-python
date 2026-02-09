# FactifyAPIV1betaListOrganizationInvitesResponse

ListOrganizationInvitesResponse contains a page of invitations.


## Fields

| Field                                                                                                      | Type                                                                                                       | Required                                                                                                   | Description                                                                                                |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `items`                                                                                                    | List[[models.FactifyAPIV1betaOrganizationInvite](../models/factifyapiv1betaorganizationinvite.md)]         | :heavy_minus_sign:                                                                                         | List of invitations.                                                                                       |
| `pagination`                                                                                               | [models.FactifyAPIV1betaPagination](../models/factifyapiv1betapagination.md)                               | :heavy_check_mark:                                                                                         | Pagination contains cursor-based pagination metadata.<br/> Follows Google AIP-158 for pagination field naming. |