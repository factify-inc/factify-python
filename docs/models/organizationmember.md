# OrganizationMember

OrganizationMember represents a member of an organization.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `email`                                                              | *str*                                                                | :heavy_check_mark:                                                   | Email address of the member.                                         |
| `joined_at`                                                          | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_check_mark:                                                   | When the member joined the organization.                             |
| `role`                                                               | [models.OrganizationRole](../models/organizationrole.md)             | :heavy_check_mark:                                                   | N/A                                                                  |
| `user`                                                               | [models.User](../models/user.md)                                     | :heavy_check_mark:                                                   | User represents a user or service account.                           |