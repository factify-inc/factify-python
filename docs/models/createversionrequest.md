# CreateVersionRequest

CreateVersionRequest contains the file and metadata for creating a version.


## Fields

| Field                                                                          | Type                                                                           | Required                                                                       | Description                                                                    |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `description`                                                                  | *OptionalNullable[str]*                                                        | :heavy_minus_sign:                                                             | Description of changes in this version.                                        |
| `payload`                                                                      | [models.CreateVersionRequestPayload](../models/createversionrequestpayload.md) | :heavy_check_mark:                                                             | PDF file for new version                                                       |
| `title`                                                                        | *OptionalNullable[str]*                                                        | :heavy_minus_sign:                                                             | Optional version title.                                                        |