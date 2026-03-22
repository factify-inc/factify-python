# Organizations

## Overview

Create and manage organizations.

### Available Operations

* [list](#list) - List organizations
* [get](#get) - Retrieve an organization
* [update](#update) - Update an organization

## list

List organizations the caller has access to.

### Example Usage

<!-- UsageSnippet language="python" operationID="listOrganizations" method="get" path="/v1beta/organizations" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.list()

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                                                         | Type                                                                                                                                                                              | Required                                                                                                                                                                          | Description                                                                                                                                                                       |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `page_token`                                                                                                                                                                      | *Optional[str]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Opaque pagination token from a previous response.                                                                                                                                 |
| `page_size`                                                                                                                                                                       | *Optional[int]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                  |
| `role`                                                                                                                                                                            | List[[models.OrganizationRole](../../models/organizationrole.md)]                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                | Filter by the caller's role in the organization.<br/> If omitted or empty, returns all organizations the caller can view (no filtering).<br/> REST: ?role=admin or ?role=admin&role=owner |
| `retries`                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                               |

### Response

**[models.ListOrganizationsResponseResponse](../../models/listorganizationsresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get

Retrieve an organization by ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getOrganization" method="get" path="/v1beta/organizations/{organization_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.get(organization_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `organization_id`                                                   | *str*                                                               | :heavy_check_mark:                                                  | Organization ID.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}           |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.GetOrganizationResponseResponse](../../models/getorganizationresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update

Update an organization's display name.
 Authorization: Requires organization#administer permission (owner or admin).

### Example Usage

<!-- UsageSnippet language="python" operationID="updateOrganization" method="patch" path="/v1beta/organizations/{organization_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.update(organization_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `organization_id`                                                   | *str*                                                               | :heavy_check_mark:                                                  | Organization ID.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}           |
| `name`                                                              | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | Optional new display name. nil = no change. Minimum 1 character.    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.UpdateOrganizationResponseResponse](../../models/updateorganizationresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |