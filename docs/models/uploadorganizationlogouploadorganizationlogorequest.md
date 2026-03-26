# UploadOrganizationLogoUploadOrganizationLogoRequest

UploadOrganizationLogoRequest contains the logo image to upload.


## Fields

| Field                                                                   | Type                                                                    | Required                                                                | Description                                                             |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `content_type`                                                          | *Optional[str]*                                                         | :heavy_minus_sign:                                                      | Informational content type. The server detects format from magic bytes. |
| `image_data`                                                            | *Optional[str]*                                                         | :heavy_minus_sign:                                                      | Raw image bytes. Maximum 2 MB. Accepted formats: JPEG, PNG, WebP, SVG.  |