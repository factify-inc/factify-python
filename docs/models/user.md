# User

User represents a human user account.
 Returned by GetUser (endpoint deferred).


## Fields

| Field                                | Type                                 | Required                             | Description                          | Example                              |
| ------------------------------------ | ------------------------------------ | ------------------------------------ | ------------------------------------ | ------------------------------------ |
| `email`                              | *str*                                | :heavy_check_mark:                   | N/A                                  |                                      |
| `family_name`                        | *OptionalNullable[str]*              | :heavy_minus_sign:                   | Family name (last name) of the user. |                                      |
| `given_name`                         | *OptionalNullable[str]*              | :heavy_minus_sign:                   | Given name (first name) of the user. |                                      |
| `id`                                 | *str*                                | :heavy_check_mark:                   | N/A                                  | user_01h2xcejqtf2nbrexx3vqjhp41      |
| `name`                               | *str*                                | :heavy_check_mark:                   | Display name of the user.            |                                      |
| `profile_image_url`                  | *OptionalNullable[str]*              | :heavy_minus_sign:                   | URL of the user's profile image.     |                                      |