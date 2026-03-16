# RecipientGrant

RecipientGrant specifies a recipient and role for granting access.


## Fields

| Field                                                  | Type                                                   | Required                                               | Description                                            |
| ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ |
| `recipient`                                            | *Optional[str]*                                        | :heavy_minus_sign:                                     | Recipient email address or TypeID (user_xxx, bot_xxx). |
| `role`                                                 | [models.DocumentRole](../models/documentrole.md)       | :heavy_check_mark:                                     | N/A                                                    |