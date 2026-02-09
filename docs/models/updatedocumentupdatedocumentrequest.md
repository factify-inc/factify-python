# UpdateDocumentUpdateDocumentRequest

UpdateDocumentRequest specifies fields to update on a document.


## Fields

| Field                                                       | Type                                                        | Required                                                    | Description                                                 |
| ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- | ----------------------------------------------------------- |
| `document_id`                                               | *Optional[str]*                                             | :heavy_minus_sign:                                          | Document ID to update.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26} |
| `title`                                                     | *OptionalNullable[str]*                                     | :heavy_minus_sign:                                          | New title (1-255 characters).                               |
| `description`                                               | *OptionalNullable[str]*                                     | :heavy_minus_sign:                                          | New description (max 2000 characters).                      |