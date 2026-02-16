# Quotas

## Overview

### Available Operations

* [quota_service_delete_organization_quota](#quota_service_delete_organization_quota) - DeleteOrganizationQuota removes quota configuration for an organization.  The organization will fall back to default free tier limits.  Requires platform admin permission. ConnectRPC only (not exposed via REST).
* [quota_service_set_organization_quota](#quota_service_set_organization_quota) - SetOrganizationQuota creates or updates quota configuration for an organization.  Requires platform admin permission. ConnectRPC only (not exposed via REST).

## quota_service_delete_organization_quota

DeleteOrganizationQuota removes quota configuration for an organization.
 The organization will fall back to default free tier limits.
 Requires platform admin permission. ConnectRPC only (not exposed via REST).

### Example Usage

<!-- UsageSnippet language="python" operationID="QuotaService_DeleteOrganizationQuota" method="post" path="/factify.api.v1beta.QuotaService/DeleteOrganizationQuota" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_delete_organization_quota()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `connect_timeout_ms`                                                | *Optional[float]*                                                   | :heavy_minus_sign:                                                  | N/A                                                                 |
| `organization_id`                                                   | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | The organization ID (required).                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.QuotaServiceDeleteOrganizationQuotaResponse](../../models/quotaservicedeleteorganizationquotaresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## quota_service_set_organization_quota

SetOrganizationQuota creates or updates quota configuration for an organization.
 Requires platform admin permission. ConnectRPC only (not exposed via REST).

### Example Usage

<!-- UsageSnippet language="python" operationID="QuotaService_SetOrganizationQuota" method="post" path="/factify.api.v1beta.QuotaService/SetOrganizationQuota" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_set_organization_quota()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                            | Type                                                                                                                                                 | Required                                                                                                                                             | Description                                                                                                                                          |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `connect_timeout_ms`                                                                                                                                 | *Optional[float]*                                                                                                                                    | :heavy_minus_sign:                                                                                                                                   | N/A                                                                                                                                                  |
| `limit`                                                                                                                                              | *OptionalNullable[int]*                                                                                                                              | :heavy_minus_sign:                                                                                                                                   | Optional limit override. If not set, uses the configured tier default.<br/> Must be > 0 when set. Use a very high value (e.g., 999999999) for unlimited. |
| `organization_id`                                                                                                                                    | *Optional[str]*                                                                                                                                      | :heavy_minus_sign:                                                                                                                                   | The organization ID (required).                                                                                                                      |
| `tier`                                                                                                                                               | [Optional[models.QuotaTier]](../../models/quotatier.md)                                                                                              | :heavy_minus_sign:                                                                                                                                   | QuotaTier represents the organization's quota tier.                                                                                                  |
| `retries`                                                                                                                                            | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                     | :heavy_minus_sign:                                                                                                                                   | Configuration to override the default retry behavior of the client.                                                                                  |

### Response

**[models.QuotaServiceSetOrganizationQuotaResponse](../../models/quotaservicesetorganizationquotaresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |