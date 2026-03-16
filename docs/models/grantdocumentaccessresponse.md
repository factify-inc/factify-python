# GrantDocumentAccessResponse

GrantDocumentAccessResponse contains the results of granting access.


## Fields

| Field                                                            | Type                                                             | Required                                                         | Description                                                      |
| ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| `document_id`                                                    | *Optional[str]*                                                  | :heavy_minus_sign:                                               | Document ID.                                                     |
| `failed`                                                         | *Optional[int]*                                                  | :heavy_minus_sign:                                               | Number of failed grants.                                         |
| `results`                                                        | List[[models.AccessGrantResult](../models/accessgrantresult.md)] | :heavy_minus_sign:                                               | Results for each recipient.                                      |
| `successful`                                                     | *Optional[int]*                                                  | :heavy_minus_sign:                                               | Number of successful grants.                                     |
| `total`                                                          | *Optional[int]*                                                  | :heavy_minus_sign:                                               | Total number of recipients processed.                            |