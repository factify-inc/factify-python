# GetUsageHistoryResponse

GetUsageHistoryResponse returns usage history.


## Fields

| Field                                              | Type                                               | Required                                           | Description                                        | Example                                            |
| -------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------- |
| `daily_usage`                                      | List[[models.DailyUsage](../models/dailyusage.md)] | :heavy_minus_sign:                                 | Daily usage records.                               |                                                    |
| `organization_id`                                  | *Optional[str]*                                    | :heavy_minus_sign:                                 | The organization ID.                               | org_01h2xcejqtf2nbrexx3vqjhp41                     |
| `total_requests`                                   | *Optional[int]*                                    | :heavy_minus_sign:                                 | Total requests in the period.                      |                                                    |