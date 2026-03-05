# Organizations

## Overview

Create and manage organizations and member invitations.

### Available Operations

* [list](#list) - List organizations
* [create](#create) - Create an organization
* [get](#get) - Retrieve an organization
* [accept_organization_invite](#accept_organization_invite) - Accept an invitation
* [resend_organization_invite](#resend_organization_invite) - Resend an invitation email
* [revoke_organization_invite](#revoke_organization_invite) - Revoke an invitation
* [list_organization_members](#list_organization_members) - List organization members
* [add_organization_member](#add_organization_member) - Add a member to an organization
* [remove_organization_member](#remove_organization_member) - Remove an organization member
* [update_organization_member](#update_organization_member) - Update an organization member

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

## create

Creates a new organization. The authenticated user becomes the organization owner.

### Example Usage

<!-- UsageSnippet language="python" operationID="createOrganization" method="post" path="/v1beta/organizations" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.create(name="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                     | Required                                                                                                                                                                                                                                                                                 | Description                                                                                                                                                                                                                                                                              |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`                                                                                                                                                                                                                                                                                   | *str*                                                                                                                                                                                                                                                                                    | :heavy_check_mark:                                                                                                                                                                                                                                                                       | Human-readable organization name.                                                                                                                                                                                                                                                        |
| `owner_user_id`                                                                                                                                                                                                                                                                          | *OptionalNullable[str]*                                                                                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                                       | Owner user ID. If not provided, the authenticated user becomes the owner.<br/> Authorization: Specifying a different user requires system maintainer role.<br/> Required when the caller is a service account (service accounts cannot own organizations).<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |
| `retries`                                                                                                                                                                                                                                                                                | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                                         | :heavy_minus_sign:                                                                                                                                                                                                                                                                       | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                                      |

### Response

**[models.CreateOrganizationResponseResponse](../../models/createorganizationresponseresponse.md)**

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

## accept_organization_invite

Accepts the invitation and adds the authenticated user as a member of the organization. The authenticated user's verified email must match the invitation email (case-insensitive). Returns PERMISSION_DENIED if emails don't match, FAILED_PRECONDITION if the user is already a member, or NOT_FOUND if the invitation is invalid/expired.

### Example Usage

<!-- UsageSnippet language="python" operationID="acceptOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/accept" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.accept_organization_invite(organization_id="<id>", token="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `organization_id`                                                                             | *str*                                                                                         | :heavy_check_mark:                                                                            | Organization the invitation belongs to (for validation).<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `token`                                                                                       | *str*                                                                                         | :heavy_check_mark:                                                                            | The invitation token from the email link.                                                     |
| `retries`                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                              | :heavy_minus_sign:                                                                            | Configuration to override the default retry behavior of the client.                           |

### Response

**[models.AcceptOrganizationInviteResponseResponse](../../models/acceptorganizationinviteresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## resend_organization_invite

Resend an invitation email to the recipient. Useful if the original email was lost or expired. Requires permission to invite organization members.

### Example Usage

<!-- UsageSnippet language="python" operationID="resendOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/{invite_id}/resend" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.resend_organization_invite(organization_id="<id>", invite_id="<id>", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                 | Type                                                                                                                                      | Required                                                                                                                                  | Description                                                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                         | *str*                                                                                                                                     | :heavy_check_mark:                                                                                                                        | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                          |
| `invite_id`                                                                                                                               | *str*                                                                                                                                     | :heavy_check_mark:                                                                                                                        | Invitation ID to resend.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}                                                                         |
| `body`                                                                                                                                    | [models.ResendOrganizationInviteResendOrganizationInviteRequest](../../models/resendorganizationinviteresendorganizationinviterequest.md) | :heavy_check_mark:                                                                                                                        | N/A                                                                                                                                       |
| `retries`                                                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                          | :heavy_minus_sign:                                                                                                                        | Configuration to override the default retry behavior of the client.                                                                       |

### Response

**[models.ResendOrganizationInviteResponseResponse](../../models/resendorganizationinviteresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## revoke_organization_invite

Revoke a pending invitation, preventing the recipient from joining. Requires permission to manage organization members.

### Example Usage

<!-- UsageSnippet language="python" operationID="revokeOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/{invite_id}/revoke" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.revoke_organization_invite(organization_id="<id>", invite_id="<id>", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                 | Type                                                                                                                                      | Required                                                                                                                                  | Description                                                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                         | *str*                                                                                                                                     | :heavy_check_mark:                                                                                                                        | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                          |
| `invite_id`                                                                                                                               | *str*                                                                                                                                     | :heavy_check_mark:                                                                                                                        | Invitation ID to revoke.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}                                                                         |
| `body`                                                                                                                                    | [models.RevokeOrganizationInviteRevokeOrganizationInviteRequest](../../models/revokeorganizationinviterevokeorganizationinviterequest.md) | :heavy_check_mark:                                                                                                                        | N/A                                                                                                                                       |
| `retries`                                                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                          | :heavy_minus_sign:                                                                                                                        | Configuration to override the default retry behavior of the client.                                                                       |

### Response

**[models.RevokeOrganizationInviteResponseResponse](../../models/revokeorganizationinviteresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## list_organization_members

List members of an organization. Requires organization membership.

### Example Usage

<!-- UsageSnippet language="python" operationID="listOrganizationMembers" method="get" path="/v1beta/organizations/{organization_id}/members" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.list_organization_members(organization_id="<id>")

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

    res = f_client.organizations.add_organization_member(organization_id="<id>", role="owner", user_id="<id>")

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

    res = f_client.organizations.remove_organization_member(organization_id="<id>", user_id="<id>")

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

    res = f_client.organizations.update_organization_member(organization_id="<id>", user_id="<id>", role="member")

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