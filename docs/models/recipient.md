# Recipient

Recipient represents an entity with access to a document.


## Fields

| Field                                                 | Type                                                  | Required                                              | Description                                           |
| ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- |
| `document_role`                                       | [models.DocumentRole](../models/documentrole.md)      | :heavy_check_mark:                                    | N/A                                                   |
| `email`                                               | *Optional[str]*                                       | :heavy_minus_sign:                                    | Email (only for user recipients).                     |
| `id`                                                  | *str*                                                 | :heavy_check_mark:                                    | Recipient ID (TypeID: user_xxx, bot_xxx, or org_xxx). |
| `name`                                                | *Optional[str]*                                       | :heavy_minus_sign:                                    | Display name.                                         |
| `type`                                                | [models.RecipientType](../models/recipienttype.md)    | :heavy_check_mark:                                    | N/A                                                   |