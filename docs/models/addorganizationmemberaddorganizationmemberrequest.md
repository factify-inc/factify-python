# AddOrganizationMemberAddOrganizationMemberRequest

AddOrganizationMemberRequest identifies a user to add as a member.


## Fields

| Field                                                                       | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `role`                                                                      | [models.OrganizationRole](../models/organizationrole.md)                    | :heavy_check_mark:                                                          | N/A                                                                         |
| `user_id`                                                                   | *str*                                                                       | :heavy_check_mark:                                                          | User account ID of the member to add.<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |