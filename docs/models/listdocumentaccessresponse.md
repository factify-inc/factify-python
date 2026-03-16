# ListDocumentAccessResponse

ListDocumentAccessResponse contains the access list and general access level.


## Fields

| Field                                                                  | Type                                                                   | Required                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `document_id`                                                          | *Optional[str]*                                                        | :heavy_minus_sign:                                                     | Document ID.                                                           |
| `general_access_level`                                                 | [Optional[models.GeneralAccessLevel]](../models/generalaccesslevel.md) | :heavy_minus_sign:                                                     | N/A                                                                    |
| `recipients`                                                           | List[[models.Recipient](../models/recipient.md)]                       | :heavy_minus_sign:                                                     | Recipients with access.                                                |