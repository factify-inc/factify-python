# AccessGrantResult

AccessGrantResult contains the outcome of granting access to one recipient.


## Fields

| Field                                  | Type                                   | Required                               | Description                            |
| -------------------------------------- | -------------------------------------- | -------------------------------------- | -------------------------------------- |
| `error`                                | *Optional[str]*                        | :heavy_minus_sign:                     | Error message if the grant failed.     |
| `recipient`                            | *Optional[str]*                        | :heavy_minus_sign:                     | The recipient that was granted access. |
| `success`                              | *Optional[bool]*                       | :heavy_minus_sign:                     | Whether the grant succeeded.           |