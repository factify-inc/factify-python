# GrantDocumentAccessGrantDocumentAccessRequest

GrantDocumentAccessRequest grants access to one or more recipients.


## Fields

| Field                                                      | Type                                                       | Required                                                   | Description                                                |
| ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- |
| `custom_message`                                           | *OptionalNullable[str]*                                    | :heavy_minus_sign:                                         | Custom message to include in the notification email.       |
| `recipients`                                               | List[[models.RecipientGrant](../models/recipientgrant.md)] | :heavy_minus_sign:                                         | Recipients to grant access to (1-50).                      |
| `should_send_notification`                                 | *OptionalNullable[bool]*                                   | :heavy_minus_sign:                                         | Whether to send email notifications.                       |