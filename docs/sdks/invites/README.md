# Organizations.Invites

## Overview

### Available Operations

* [list](#list) - List organization invitations
* [create](#create) - Invite a user to join an organization

## list

List invitations for an organization. Requires permission to invite organization members.

### Example Usage

<!-- UsageSnippet language="python" operationID="listOrganizationInvites" method="get" path="/v1beta/organizations/{organization_id}/invites" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.invites.list(organization_id="<id>")

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                             | Type                                                                                                                                                  | Required                                                                                                                                              | Description                                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                                     | *str*                                                                                                                                                 | :heavy_check_mark:                                                                                                                                    | Organization to list invitations for.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                        |
| `status`                                                                                                                                              | List[[models.OrganizationInviteStatus](../../models/organizationinvitestatus.md)]                                                                     | :heavy_minus_sign:                                                                                                                                    | Filter by status. If empty, returns all invitations.<br/> ORGANIZATION_INVITE_STATUS_UNSPECIFIED (0) is not a valid filter value.                     |
| `page_token`                                                                                                                                          | *Optional[str]*                                                                                                                                       | :heavy_minus_sign:                                                                                                                                    | Opaque pagination token from a previous response.                                                                                                     |
| `page_size`                                                                                                                                           | *Optional[int]*                                                                                                                                       | :heavy_minus_sign:                                                                                                                                    | Maximum number of items to return per page (1-100). Default: 50.                                                                                      |
| `email_contains`                                                                                                                                      | *Optional[str]*                                                                                                                                       | :heavy_minus_sign:                                                                                                                                    | Case-insensitive substring match.<br/> REST: ?field.contains=value                                                                                    |
| `email_exact`                                                                                                                                         | *Optional[str]*                                                                                                                                       | :heavy_minus_sign:                                                                                                                                    | Exact match (case-sensitive).<br/> REST: ?field.exact=value                                                                                           |
| `sender_id`                                                                                                                                           | *Optional[str]*                                                                                                                                       | :heavy_minus_sign:                                                                                                                                    | Filter by sender. Only returns invitations sent by this user.<br/> REST: ?sender_id=user_01h2xcejqtf2nbrexx3vqjhp41<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26} |
| `created_after`                                                                                                                                       | [date](https://docs.python.org/3/library/datetime.html#date-objects)                                                                                  | :heavy_minus_sign:                                                                                                                                    | Filter by created.after (RFC 3339 format, e.g., 2024-01-15T09:30:00Z)                                                                                 |
| `retries`                                                                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                      | :heavy_minus_sign:                                                                                                                                    | Configuration to override the default retry behavior of the client.                                                                                   |

### Response

**[models.ListOrganizationInvitesResponseResponse](../../models/listorganizationinvitesresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create

Creates an invitation and sends an email to the specified address. Returns FAILED_PRECONDITION if the email belongs to an existing organization member. Idempotency: If a PENDING invitation already exists for this email, the existing invitation is resent with a new token and refreshed expiration. Expired or revoked invitations are ignored - a new invitation is created.

### Example Usage

<!-- UsageSnippet language="python" operationID="createOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.invites.create(organization_id="<id>", email="Willie_Parisian16@hotmail.com")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                         | Type                                                                                                                                                                                                              | Required                                                                                                                                                                                                          | Description                                                                                                                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                                                                                                 | *str*                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                | Organization to invite the user to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                      |
| `email`                                                                                                                                                                                                           | *str*                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                | Email address of the recipient.                                                                                                                                                                                   |
| `idempotency_key`                                                                                                                                                                                                 | *OptionalNullable[str]*                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                | Reserved for future use. Currently, idempotency is based on email matching:<br/> if a PENDING invitation exists for the same email in this organization,<br/> that invitation is resent rather than creating a duplicate. |
| `message`                                                                                                                                                                                                         | *OptionalNullable[str]*                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                | Optional custom message from the sender (max 2000 bytes to support ~500 multibyte characters).                                                                                                                    |
| `retries`                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                               |

### Response

**[models.CreateOrganizationInviteResponseResponse](../../models/createorganizationinviteresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |