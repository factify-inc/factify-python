# Organization

Organization represents a Factify organization.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          | Example                                                              |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `created_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_check_mark:                                                   | Timestamp when the organization was created.                         |                                                                      |
| `id`                                                                 | *str*                                                                | :heavy_check_mark:                                                   | Unique ID for the organization.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} | org_01h2xcejqtf2nbrexx3vqjhp41                                       |
| `name`                                                               | *str*                                                                | :heavy_check_mark:                                                   | Human-readable organization name.                                    | Acme Corporation                                                     |