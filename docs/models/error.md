# Error


## Fields

| Field                                                   | Type                                                    | Required                                                | Description                                             |
| ------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- |
| `code`                                                  | *str*                                                   | :heavy_check_mark:                                      | Specific error code for detailed handling               |
| `message`                                               | *str*                                                   | :heavy_check_mark:                                      | Human-readable error message                            |
| `param`                                                 | *Nullable[str]*                                         | :heavy_check_mark:                                      | Parameter that caused the error (for validation errors) |
| `retry_after`                                           | *Nullable[int]*                                         | :heavy_check_mark:                                      | Seconds to wait before retrying (for rate limit errors) |
| `type`                                                  | [models.Type](../models/type.md)                        | :heavy_check_mark:                                      | Error type for programmatic handling                    |