# Organizations.Invites

## Overview

### Available Operations

* [list](#list) - List organization invitations
* [create](#create) - Invite a user to join an organization
* [accept](#accept) - Accept an invitation
* [resend](#resend) - Resend an invitation email
* [revoke](#revoke) - Revoke an invitation

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create

Creates an invitation and sends an email to the specified address. Returns FAILED_PRECONDITION if the email belongs to an existing organization member. Idempotency: If a PENDING invitation already exists for this email, the existing invitation is resent (same token, refreshed expiration). Expired or revoked invitations are ignored - a new invitation is created.

### Example Usage

<!-- UsageSnippet language="python" operationID="createOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.invites.create(organization_id="<id>", email="Willie_Parisian16@hotmail.com")

    assert res.create_organization_invite_response is not None

    # Handle response
    print(res.create_organization_invite_response)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                         | Type                                                                                                                                                                                                                                                              | Required                                                                                                                                                                                                                                                          | Description                                                                                                                                                                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                                                                                                                                                 | *str*                                                                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                                | Organization to invite the user to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                                                                      |
| `email`                                                                                                                                                                                                                                                           | *str*                                                                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                                                                | Email address of the recipient.                                                                                                                                                                                                                                   |
| `idempotency_key`                                                                                                                                                                                                                                                 | *OptionalNullable[str]*                                                                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                                                | Optional client-provided idempotency key for safe retries.<br/> If provided, duplicate requests with the same key within 24 hours<br/> return the original response without resending the invitation email.<br/> Recommended format: UUID or org_id + email + timestamp hash. |
| `message`                                                                                                                                                                                                                                                         | *OptionalNullable[str]*                                                                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                                                                | Optional custom message from the sender (max 2000 bytes to support ~500 multibyte characters).                                                                                                                                                                    |
| `retries`                                                                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                                                                               |

### Response

**[models.CreateOrganizationInviteResponseResponse](../../models/createorganizationinviteresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## accept

Accepts the invitation and adds the authenticated user as a member of the organization. The authenticated user's verified email must match the invitation email (case-insensitive). Returns PERMISSION_DENIED if emails don't match, FAILED_PRECONDITION if the user is already a member, or NOT_FOUND if the invitation is invalid/expired.

### Example Usage

<!-- UsageSnippet language="python" operationID="acceptOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/{invite_id}:accept" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.invites.accept(organization_id="<id>", invite_id="<id>", token="<value>")

    assert res.accept_organization_invite_response is not None

    # Handle response
    print(res.accept_organization_invite_response)

```

### Parameters

| Parameter                                                                    | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `organization_id`                                                            | *str*                                                                        | :heavy_check_mark:                                                           | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `invite_id`                                                                  | *str*                                                                        | :heavy_check_mark:                                                           | Invitation ID to accept.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}            |
| `token`                                                                      | *str*                                                                        | :heavy_check_mark:                                                           | The invitation token from the email link.                                    |
| `retries`                                                                    | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)             | :heavy_minus_sign:                                                           | Configuration to override the default retry behavior of the client.          |

### Response

**[models.AcceptOrganizationInviteResponseResponse](../../models/acceptorganizationinviteresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## resend

Resend an invitation email to the recipient. Useful if the original email was lost or expired. Requires permission to invite organization members.

### Example Usage

<!-- UsageSnippet language="python" operationID="resendOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/{invite_id}:resend" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.invites.resend(organization_id="<id>", invite_id="<id>", body={})

    assert res.resend_organization_invite_response is not None

    # Handle response
    print(res.resend_organization_invite_response)

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## revoke

Revoke a pending invitation, preventing the recipient from joining. Requires permission to manage organization members.

### Example Usage

<!-- UsageSnippet language="python" operationID="revokeOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/{invite_id}:revoke" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.invites.revoke(organization_id="<id>", invite_id="<id>", body={})

    assert res.revoke_organization_invite_response is not None

    # Handle response
    print(res.revoke_organization_invite_response)

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
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |