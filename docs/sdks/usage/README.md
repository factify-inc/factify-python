# Usage

## Overview

Query API usage and quota information for your organization.

### Available Operations

* [get](#get) - Get organization quota status
* [list_key_quotas](#list_key_quotas) - List API key quotas
* [delete_key_quota](#delete_key_quota) - Delete API key quota
* [set_key_quota](#set_key_quota) - Set API key quota
* [get_history](#get_history) - Get usage history

## get

Returns the current quota status for an organization including usage, limits, tier, and reset date.

### Example Usage

<!-- UsageSnippet language="python" operationID="getOrganizationQuota" method="get" path="/v1beta/quota" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.get(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                        | Type                                                                                                                             | Required                                                                                                                         | Description                                                                                                                      | Example                                                                                                                          |
| -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                | *Optional[str]*                                                                                                                  | :heavy_minus_sign:                                                                                                               | Optional: organization ID to query. If not provided, uses the caller's organization.<br/> Only admins can query other organizations. | org_01h2xcejqtf2nbrexx3vqjhp41                                                                                                   |
| `retries`                                                                                                                        | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                 | :heavy_minus_sign:                                                                                                               | Configuration to override the default retry behavior of the client.                                                              |                                                                                                                                  |

### Response

**[models.GetOrganizationQuotaResponseResponse](../../models/getorganizationquotaresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## list_key_quotas

Returns all per-key quota configurations and current usage for an organization.

### Example Usage

<!-- UsageSnippet language="python" operationID="listAPIKeyQuotas" method="get" path="/v1beta/quota/keys" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.list_key_quotas(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `organization_id`                                                           | *Optional[str]*                                                             | :heavy_minus_sign:                                                          | Optional: organization ID. If not provided, uses the caller's organization. | org_01h2xcejqtf2nbrexx3vqjhp41                                              |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |                                                                             |

### Response

**[models.ListAPIKeyQuotasResponseResponse](../../models/listapikeyquotasresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## delete_key_quota

Removes the per-key quota limit. The key will only be subject to the organization-level quota.

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteAPIKeyQuota" method="delete" path="/v1beta/quota/keys/{api_key_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.delete_key_quota(api_key_id="<id>", organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `api_key_id`                                                                | *str*                                                                       | :heavy_check_mark:                                                          | The API key ID (required).                                                  |                                                                             |
| `organization_id`                                                           | *Optional[str]*                                                             | :heavy_minus_sign:                                                          | Optional: organization ID. If not provided, uses the caller's organization. | org_01h2xcejqtf2nbrexx3vqjhp41                                              |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |                                                                             |

### Response

**[models.DeleteAPIKeyQuotaResponseResponse](../../models/deleteapikeyquotaresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## set_key_quota

Creates or updates a per-key quota limit. The key will be enforced independently of the organization quota.

### Example Usage

<!-- UsageSnippet language="python" operationID="setAPIKeyQuota" method="put" path="/v1beta/quota/keys/{api_key_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.set_key_quota(api_key_id="<id>", organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 | Example                                                                     |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `api_key_id`                                                                | *str*                                                                       | :heavy_check_mark:                                                          | The API key ID (required).                                                  |                                                                             |
| `limit`                                                                     | *OptionalNullable[int]*                                                     | :heavy_minus_sign:                                                          | The limit for this key. Must be > 0.                                        |                                                                             |
| `organization_id`                                                           | *OptionalNullable[str]*                                                     | :heavy_minus_sign:                                                          | Optional: organization ID. If not provided, uses the caller's organization. | org_01h2xcejqtf2nbrexx3vqjhp41                                              |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |                                                                             |

### Response

**[models.SetAPIKeyQuotaResponseResponse](../../models/setapikeyquotaresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get_history

Returns daily usage records for an organization within a specified date range.

### Example Usage

<!-- UsageSnippet language="python" operationID="getUsageHistory" method="get" path="/v1beta/quota/usage" -->
```python
from factify import Factify
from factify.utils import parse_datetime


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.get_history(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41", date_after=parse_datetime("2023-01-15T01:30:15.01Z"), date_before=parse_datetime("2023-01-15T01:30:15.01Z"))

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                            | Type                                                                                 | Required                                                                             | Description                                                                          | Example                                                                              |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| `organization_id`                                                                    | *Optional[str]*                                                                      | :heavy_minus_sign:                                                                   | Optional: organization ID to query. If not provided, uses the caller's organization. | org_01h2xcejqtf2nbrexx3vqjhp41                                                       |
| `date_after`                                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects)                 | :heavy_minus_sign:                                                                   | Return results after this timestamp (inclusive).                                     | 2023-01-15T01:30:15.01Z                                                              |
| `date_before`                                                                        | [date](https://docs.python.org/3/library/datetime.html#date-objects)                 | :heavy_minus_sign:                                                                   | Return results before this timestamp (inclusive).                                    | 2023-01-15T01:30:15.01Z                                                              |
| `retries`                                                                            | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                     | :heavy_minus_sign:                                                                   | Configuration to override the default retry behavior of the client.                  |                                                                                      |

### Response

**[models.GetUsageHistoryResponseResponse](../../models/getusagehistoryresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |