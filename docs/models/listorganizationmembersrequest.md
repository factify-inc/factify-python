# ListOrganizationMembersRequest


## Fields

| Field                                                                  | Type                                                                   | Required                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `organization_id`                                                      | *str*                                                                  | :heavy_check_mark:                                                     | Organization to list members for.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `page_token`                                                           | *Optional[str]*                                                        | :heavy_minus_sign:                                                     | Opaque pagination token from a previous response.                      |
| `page_size`                                                            | *Optional[int]*                                                        | :heavy_minus_sign:                                                     | Maximum number of items to return per page (1-100). Default: 50.       |