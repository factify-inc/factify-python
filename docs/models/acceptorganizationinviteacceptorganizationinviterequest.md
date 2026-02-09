# AcceptOrganizationInviteAcceptOrganizationInviteRequest

AcceptOrganizationInviteRequest contains the token to accept an invitation.


## Fields

| Field                                                                                         | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `organization_id`                                                                             | *str*                                                                                         | :heavy_check_mark:                                                                            | Organization the invitation belongs to (for validation).<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `token`                                                                                       | *str*                                                                                         | :heavy_check_mark:                                                                            | The invitation token from the email link.                                                     |