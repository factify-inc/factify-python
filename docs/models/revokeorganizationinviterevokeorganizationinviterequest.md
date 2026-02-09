# RevokeOrganizationInviteRevokeOrganizationInviteRequest

RevokeOrganizationInviteRequest identifies an invitation to revoke.


## Fields

| Field                                                                        | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `organization_id`                                                            | *str*                                                                        | :heavy_check_mark:                                                           | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `invite_id`                                                                  | *str*                                                                        | :heavy_check_mark:                                                           | Invitation ID to revoke.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}            |