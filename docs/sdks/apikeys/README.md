# APIKeys

## Overview

Generate and manage API keys for authentication.

### Available Operations

* [list](#list) - List API keys
* [create](#create) - Create an API key
* [revoke](#revoke) - Revoke an API key

## list

Lists API keys for an organization.

### Example Usage

<!-- UsageSnippet language="python" operationID="listApiKeys" method="get" path="/v1beta/api-keys" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.api_keys.list(organization_id="<id>")

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                     | Type                                                                                                                                                                                                                                                                          | Required                                                                                                                                                                                                                                                                      | Description                                                                                                                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                                                                                                                                                             | *str*                                                                                                                                                                                                                                                                         | :heavy_check_mark:                                                                                                                                                                                                                                                            | Organization ID to list keys for.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                                                                                    |
| `include_revoked`                                                                                                                                                                                                                                                             | *Optional[bool]*                                                                                                                                                                                                                                                              | :heavy_minus_sign:                                                                                                                                                                                                                                                            | Whether to include revoked keys in the response.<br/> Default: false (only active and expired-but-not-revoked keys are returned).<br/> When true, all keys including revoked ones are returned.<br/> Note: Expired keys are always included unless also revoked; use is_active to filter. |
| `page_token`                                                                                                                                                                                                                                                                  | *Optional[str]*                                                                                                                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                                                                                                                            | Opaque pagination token from a previous response.                                                                                                                                                                                                                             |
| `page_size`                                                                                                                                                                                                                                                                   | *Optional[int]*                                                                                                                                                                                                                                                               | :heavy_minus_sign:                                                                                                                                                                                                                                                            | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                                                                                                              |
| `retries`                                                                                                                                                                                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                              | :heavy_minus_sign:                                                                                                                                                                                                                                                            | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                           |

### Response

**[models.ListAPIKeysResponseResponse](../../models/listapikeysresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create

Creates a new API key for the specified organization. The secret is only returned once in the response and cannot be retrieved later.

### Example Usage

<!-- UsageSnippet language="python" operationID="createApiKey" method="post" path="/v1beta/api-keys" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.api_keys.create(name="<value>", organization_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                    | Type                                                                                                                                                                                                                                         | Required                                                                                                                                                                                                                                     | Description                                                                                                                                                                                                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                                                                                                                                                                                                                                       | *str*                                                                                                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                                                                           | Human-readable name for the key (e.g., "Production", "Staging").                                                                                                                                                                             |
| `organization_id`                                                                                                                                                                                                                            | *str*                                                                                                                                                                                                                                        | :heavy_check_mark:                                                                                                                                                                                                                           | Organization ID to create the key for.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                                              |
| `expires_at`                                                                                                                                                                                                                                 | [date](https://docs.python.org/3/library/datetime.html#date-objects)                                                                                                                                                                         | :heavy_minus_sign:                                                                                                                                                                                                                           | Expiration timestamp. If not set, the key does not expire.<br/> When set, must be in the future and within 1 year.<br/> Security note: Keys without expiration should be rotated periodically.<br/>timestamp.gt_now = true<br/>timestamp.within = 8760h0m0s<br/> |
| `retries`                                                                                                                                                                                                                                    | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                             | :heavy_minus_sign:                                                                                                                                                                                                                           | Configuration to override the default retry behavior of the client.                                                                                                                                                                          |

### Response

**[models.CreateAPIKeyResponseResponse](../../models/createapikeyresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## revoke

Revokes an API key, immediately preventing it from being used for authentication.

### Example Usage

<!-- UsageSnippet language="python" operationID="revokeApiKey" method="post" path="/v1beta/api-keys/{api_key_id}/revoke" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.api_keys.revoke(api_key_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                               | Type                                                                                                                                    | Required                                                                                                                                | Description                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `api_key_id`                                                                                                                            | *str*                                                                                                                                   | :heavy_check_mark:                                                                                                                      | API key ID to revoke.<br/> Pattern: key_[0-9a-hjkmnp-tv-z]{26}                                                                          |
| `reason`                                                                                                                                | *OptionalNullable[str]*                                                                                                                 | :heavy_minus_sign:                                                                                                                      | Optional reason for revocation (for audit purposes).<br/> The revoking user's identity and timestamp are captured in audit logs separately. |
| `retries`                                                                                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                        | :heavy_minus_sign:                                                                                                                      | Configuration to override the default retry behavior of the client.                                                                     |

### Response

**[models.RevokeAPIKeyResponseResponse](../../models/revokeapikeyresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |