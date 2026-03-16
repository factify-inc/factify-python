# CreateShareLinkResponse

CreateShareLinkResponse contains the created share link.


## Fields

| Field                                                 | Type                                                  | Required                                              | Description                                           |
| ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| `share_link`                                          | [Optional[models.ShareLink]](../models/sharelink.md)  | :heavy_minus_sign:                                    | ShareLink represents a shareable link for a document. |
| `short_url`                                           | *OptionalNullable[str]*                               | :heavy_minus_sign:                                    | Shortened URL for the share link (if available).      |