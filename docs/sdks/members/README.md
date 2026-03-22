# Members

## Overview

Manage organization members and their roles.

### Available Operations

* [list_organization_members](#list_organization_members) - List organization members
* [add_organization_member](#add_organization_member) - Add a member to an organization
* [remove_organization_member](#remove_organization_member) - Remove an organization member
* [update_organization_member](#update_organization_member) - Update an organization member

## list_organization_members

List members of an organization. Requires organization membership.

### Example Usage

<!-- UsageSnippet language="python" operationID="listOrganizationMembers" method="get" path="/v1beta/organizations/{organization_id}/members" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.members.list_organization_members(organization_id="<id>")

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                              | Type                                                                   | Required                                                               | Description                                                            |
| ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `organization_id`                                                      | *str*                                                                  | :heavy_check_mark:                                                     | Organization to list members for.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `page_token`                                                           | *Optional[str]*                                                        | :heavy_minus_sign:                                                     | Opaque pagination token from a previous response.                      |
| `page_size`                                                            | *Optional[int]*                                                        | :heavy_minus_sign:                                                     | Maximum number of items to return per page (1-100). Default: 50.       |
| `retries`                                                              | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)       | :heavy_minus_sign:                                                     | Configuration to override the default retry behavior of the client.    |

### Response

**[models.ListOrganizationMembersResponseResponse](../../models/listorganizationmembersresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## add_organization_member

Directly adds a user as a member of an organization. Requires manage permission (owner or admin).

### Example Usage

<!-- UsageSnippet language="python" operationID="addOrganizationMember" method="post" path="/v1beta/organizations/{organization_id}/members" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.members.add_organization_member(organization_id="<id>", role="owner", user_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                   | Type                                                                        | Required                                                                    | Description                                                                 |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| `organization_id`                                                           | *str*                                                                       | :heavy_check_mark:                                                          | Organization to add the member to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `role`                                                                      | [models.OrganizationRole](../../models/organizationrole.md)                 | :heavy_check_mark:                                                          | N/A                                                                         |
| `user_id`                                                                   | *str*                                                                       | :heavy_check_mark:                                                          | User account ID of the member to add.<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |
| `retries`                                                                   | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)            | :heavy_minus_sign:                                                          | Configuration to override the default retry behavior of the client.         |

### Response

**[models.AddOrganizationMemberResponseResponse](../../models/addorganizationmemberresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## remove_organization_member

Remove a member from an organization. Requires manage permission, or the member can remove themselves. The organization owner cannot be removed.

### Example Usage

<!-- UsageSnippet language="python" operationID="removeOrganizationMember" method="delete" path="/v1beta/organizations/{organization_id}/members/{user_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.members.remove_organization_member(organization_id="<id>", user_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                      | Type                                                                           | Required                                                                       | Description                                                                    |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `organization_id`                                                              | *str*                                                                          | :heavy_check_mark:                                                             | Organization to remove the member from.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `user_id`                                                                      | *str*                                                                          | :heavy_check_mark:                                                             | User account ID of the member to remove.<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |
| `retries`                                                                      | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)               | :heavy_minus_sign:                                                             | Configuration to override the default retry behavior of the client.            |

### Response

**[models.RemoveOrganizationMemberResponseResponse](../../models/removeorganizationmemberresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update_organization_member

Update a member's role within an organization. Requires manage permission (owner or admin). The organization owner's role cannot be changed.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateOrganizationMember" method="patch" path="/v1beta/organizations/{organization_id}/members/{user_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.members.update_organization_member(organization_id="<id>", user_id="<id>", role="member")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                      | Type                                                                           | Required                                                                       | Description                                                                    |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| `organization_id`                                                              | *str*                                                                          | :heavy_check_mark:                                                             | Organization the member belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}   |
| `user_id`                                                                      | *str*                                                                          | :heavy_check_mark:                                                             | User account ID of the member to update.<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |
| `role`                                                                         | [models.OrganizationRole](../../models/organizationrole.md)                    | :heavy_check_mark:                                                             | N/A                                                                            |
| `retries`                                                                      | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)               | :heavy_minus_sign:                                                             | Configuration to override the default retry behavior of the client.            |

### Response

**[models.UpdateOrganizationMemberResponseResponse](../../models/updateorganizationmemberresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |