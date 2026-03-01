# RemoveOrganizationMemberRequest


## Fields

| Field                                                                          | Type                                                                           | Required                                                                       | Description                                                                    |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `organization_id`                                                              | *str*                                                                          | :heavy_check_mark:                                                             | Organization to remove the member from.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `user_id`                                                                      | *str*                                                                          | :heavy_check_mark:                                                             | User account ID of the member to remove.<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |