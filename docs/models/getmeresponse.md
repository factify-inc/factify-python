# GetMeResponse

GetMeResponse contains the authenticated user's profile.


## Fields

| Field                                                                           | Type                                                                            | Required                                                                        | Description                                                                     |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| `organizations`                                                                 | List[[models.Organization](../models/organization.md)]                          | :heavy_minus_sign:                                                              | Organizations the user is a member of.                                          |
| `user`                                                                          | [models.User](../models/user.md)                                                | :heavy_check_mark:                                                              | User represents a human user account.<br/> Returned by GetUser (endpoint deferred). |