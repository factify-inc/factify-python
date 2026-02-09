# UpdateVersionUpdateVersionRequest

UpdateVersionRequest specifies fields to update on a version.


## Fields

| Field                                                      | Type                                                       | Required                                                   | Description                                                |
| ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- |
| `version_id`                                               | *Optional[str]*                                            | :heavy_minus_sign:                                         | Version ID to update.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26} |
| `title`                                                    | *OptionalNullable[str]*                                    | :heavy_minus_sign:                                         | New title (max 255 characters).                            |
| `description`                                              | *OptionalNullable[str]*                                    | :heavy_minus_sign:                                         | New description.                                           |