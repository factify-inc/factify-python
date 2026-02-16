# OrganizationQuotaConfig

OrganizationQuotaConfig represents the stored quota configuration (not current usage).


## Fields

| Field                                                                  | Type                                                                   | Required                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `created_at`                                                           | [date](https://docs.python.org/3/library/datetime.html#date-objects)   | :heavy_minus_sign:                                                     | When the configuration was created.                                    |
| `effective_limit`                                                      | *Optional[int]*                                                        | :heavy_minus_sign:                                                     | The effective limit (limit if set, otherwise tier default).            |
| `limit`                                                                | *OptionalNullable[int]*                                                | :heavy_minus_sign:                                                     | Optional limit override. If not set, uses the configured tier default. |
| `organization_id`                                                      | *Optional[str]*                                                        | :heavy_minus_sign:                                                     | The organization ID.                                                   |
| `tier`                                                                 | [Optional[models.QuotaTier]](../models/quotatier.md)                   | :heavy_minus_sign:                                                     | QuotaTier represents the organization's quota tier.                    |
| `updated_at`                                                           | [date](https://docs.python.org/3/library/datetime.html#date-objects)   | :heavy_minus_sign:                                                     | When the configuration was last updated.                               |