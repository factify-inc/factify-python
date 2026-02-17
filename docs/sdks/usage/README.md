# Usage

## Overview

Query API usage and quota information for your organization.

### Available Operations

* [get_organization_quota](#get_organization_quota) - Get organization quota status
* [list_api_key_quotas](#list_api_key_quotas) - List API key quotas
* [delete_api_key_quota](#delete_api_key_quota) - Delete API key quota
* [set_api_key_quota](#set_api_key_quota) - Set API key quota
* [get_usage_history](#get_usage_history) - Get usage history

## get_organization_quota

Returns the current quota status for an organization including usage, limits, tier, and reset date.

### Example Usage

<!-- UsageSnippet language="python" operationID="getOrganizationQuota" method="get" path="/v1beta/quota" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.get_organization_quota(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## list_api_key_quotas

Returns all per-key quota configurations and current usage for an organization.

### Example Usage

<!-- UsageSnippet language="python" operationID="listAPIKeyQuotas" method="get" path="/v1beta/quota/keys" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.list_api_key_quotas(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## delete_api_key_quota

Removes the per-key quota limit. The key will only be subject to the organization-level quota.

### Example Usage

<!-- UsageSnippet language="python" operationID="deleteAPIKeyQuota" method="delete" path="/v1beta/quota/keys/{api_key_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.delete_api_key_quota(api_key_id="<id>", organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## set_api_key_quota

Creates or updates a per-key quota limit. The key will be enforced independently of the organization quota.

### Example Usage

<!-- UsageSnippet language="python" operationID="setAPIKeyQuota" method="put" path="/v1beta/quota/keys/{api_key_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.set_api_key_quota(api_key_id="<id>", organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get_usage_history

Returns daily usage records for an organization within a specified date range.

### Example Usage

<!-- UsageSnippet language="python" operationID="getUsageHistory" method="get" path="/v1beta/quota/usage" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.usage.get_usage_history(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                            | Type                                                                                 | Required                                                                             | Description                                                                          | Example                                                                              |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| `organization_id`                                                                    | *Optional[str]*                                                                      | :heavy_minus_sign:                                                                   | Optional: organization ID to query. If not provided, uses the caller's organization. | org_01h2xcejqtf2nbrexx3vqjhp41                                                       |
| `date_after`                                                                         | [date](https://docs.python.org/3/library/datetime.html#date-objects)                 | :heavy_minus_sign:                                                                   | Filter by date.after (RFC 3339 format, e.g., 2024-01-15T09:30:00Z)                   |                                                                                      |
| `retries`                                                                            | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                     | :heavy_minus_sign:                                                                   | Configuration to override the default retry behavior of the client.                  |                                                                                      |

### Response

**[models.GetUsageHistoryResponseResponse](../../models/getusagehistoryresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |