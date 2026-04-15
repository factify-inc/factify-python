# UpdateOrganizationUpdateOrganizationRequest

UpdateOrganizationRequest contains the fields to update on an organization.


## Fields

| Field                                                                                      | Type                                                                                       | Required                                                                                   | Description                                                                                |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `logo_image_url`                                                                           | *OptionalNullable[str]*                                                                    | :heavy_minus_sign:                                                                         | Optional logo image URL. nil = no change. Pass the URL returned by UploadOrganizationLogo. |
| `name`                                                                                     | *OptionalNullable[str]*                                                                    | :heavy_minus_sign:                                                                         | Optional new display name. nil = no change. Minimum 1 character.                           |