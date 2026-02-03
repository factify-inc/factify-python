# CreateDocumentRequest

CreateDocumentRequest contains the file and metadata for creating a document.


## Fields

| Field                                                                            | Type                                                                             | Required                                                                         | Description                                                                      |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `access_level`                                                                   | [Optional[models.AccessLevel]](../models/accesslevel.md)                         | :heavy_minus_sign:                                                               | N/A                                                                              |
| `description`                                                                    | *OptionalNullable[str]*                                                          | :heavy_minus_sign:                                                               | Optional document description.                                                   |
| `payload`                                                                        | [models.CreateDocumentRequestPayload](../models/createdocumentrequestpayload.md) | :heavy_check_mark:                                                               | PDF file to upload                                                               |
| `title`                                                                          | *str*                                                                            | :heavy_check_mark:                                                               | Document title.                                                                  |