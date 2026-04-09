# Records

## Overview

Retrieve processed document content records.

### Available Operations

* [get](#get) - Retrieve a record

## get

Retrieves the processed document content record for a given version. Returns the full document and layout data.

### Example Usage

<!-- UsageSnippet language="python" operationID="getRecord" method="get" path="/v1beta/records" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.records.get(version_id="ver_01h2abcd1234efgh5678jkmnpt")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `version_id`                                                                | *str*                                                                       | :heavy_check_mark:                                                          | Version ID to retrieve the record for.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26} | ver_01h2abcd1234efgh5678jkmnpt                                              |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |                                                                             |

### Response

**[models.GetRecordResponseResponse](../../models/getrecordresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |