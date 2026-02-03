# Policy

Policy represents a governance policy.


## Fields

| Field                                                                | Type                                                                 | Required                                                             | Description                                                          | Example                                                              |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `created_at`                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects) | :heavy_check_mark:                                                   | Timestamp when policy was created.                                   |                                                                      |
| `id`                                                                 | *str*                                                                | :heavy_check_mark:                                                   | Unique ID for the policy.<br/> Pattern: pol_[0-9a-hjkmnp-tv-z]{26}   | pol_01h2xcejqtf2nbrexx3vqjhp41                                       |
| `name`                                                               | *str*                                                                | :heavy_check_mark:                                                   | Policy name.                                                         | GDPR Compliance Policy                                               |