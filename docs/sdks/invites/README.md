# Invites

## Overview

Invite users to join an organization.

### Available Operations

* [accept_organization_invite](#accept_organization_invite) - Accept an invitation
* [resend_organization_invite](#resend_organization_invite) - Resend an invitation email
* [revoke_organization_invite](#revoke_organization_invite) - Revoke an invitation

## accept_organization_invite

Accepts the invitation and adds the authenticated user as a member of the organization. The authenticated user's verified email must match the invitation email (case-insensitive). Returns PERMISSION_DENIED if emails don't match, FAILED_PRECONDITION if the user is already a member, or NOT_FOUND if the invitation is invalid/expired.

### Example Usage

<!-- UsageSnippet language="python" operationID="acceptOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites/accept" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.invites.accept_organization_invite(organization_id="<id>", token="<value>")

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

    res = f_client.invites.resend_organization_invite(organization_id="<id>", invite_id="<id>", body={})

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

    res = f_client.invites.revoke_organization_invite(organization_id="<id>", invite_id="<id>", body={})

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