# OrganizationService

## Overview

OrganizationService provides APIs for managing organizations and member invitations.

 Authorization Model:
 - CreateOrganization: Any authenticated user. The caller becomes the organization owner.
   Specifying owner_user_id for a different user requires system maintainer role.
 - GetOrganization/ListOrganizations: Requires organization membership.
 - Invitation operations: Requires organization#manage permission.

 Lifecycle Management:
 - Organizations are immutable after creation (no update/delete).
 - Invitations can be created, revoked, and resent. They expire after 7 days. ==========================================================================
 Organizations
 ==========================================================================

### Available Operations

* [list_organizations](#list_organizations) - List organizations
* [create_organization](#create_organization) - Create an organization
* [get_organization](#get_organization) - Retrieve an organization
* [list_organization_invites](#list_organization_invites) - List organization invitations
* [create_organization_invite](#create_organization_invite) - Invite a user to join an organization
* [accept_organization_invite](#accept_organization_invite) - Accept an invitation
* [resend_organization_invite](#resend_organization_invite) - Resend an invitation email
* [revoke_organization_invite](#revoke_organization_invite) - Revoke an invitation

## list_organizations

List organizations the caller has access to.

### Example Usage

<!-- UsageSnippet language="python" operationID="listOrganizations" method="get" path="/v1beta/organizations" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organization_service.list_organizations()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `page_token`                                                        | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Opaque pagination token from a previous response.                   |
| `page_size`                                                         | *Optional[int]*                                                     | :heavy_minus_sign:                                                  | Maximum number of items to return per page (1-100). Default: 50.    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaListOrganizationsResponse](../../models/factifyapiv1betalistorganizationsresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create_organization

Creates a new organization. The authenticated user becomes the organization owner.

### Example Usage

<!-- UsageSnippet language="python" operationID="createOrganization" method="post" path="/v1beta/organizations" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organization_service.create_organization(name="<value>")

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

**[models.FactifyAPIV1betaCreateOrganizationResponse](../../models/factifyapiv1betacreateorganizationresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get_organization

Retrieve an organization by ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getOrganization" method="get" path="/v1beta/organizations/{organization_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organization_service.get_organization(organization_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `organization_id`                                                   | *str*                                                               | :heavy_check_mark:                                                  | Organization ID.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}           |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaGetOrganizationResponse](../../models/factifyapiv1betagetorganizationresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## list_organization_invites

List invitations for an organization. Requires permission to invite organization members.

### Example Usage

<!-- UsageSnippet language="python" operationID="listOrganizationInvites" method="get" path="/v1beta/organizations/{organization_id}/invites" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organization_service.list_organization_invites(organization_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                            | Type                                                                                                                                                                                                                 | Required                                                                                                                                                                                                             | Description                                                                                                                                                                                                          |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id`                                                                                                                                                                                                    | *str*                                                                                                                                                                                                                | :heavy_check_mark:                                                                                                                                                                                                   | Organization to list invitations for.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                       |
| `status`                                                                                                                                                                                                             | List[[models.FactifyAPIV1betaOrganizationInviteStatus](../../models/factifyapiv1betaorganizationinvitestatus.md)]                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                   | Filter by status. If empty, returns all invitations.<br/> ORGANIZATION_INVITE_STATUS_UNSPECIFIED (0) is not a valid filter value.                                                                                    |
| `page_token`                                                                                                                                                                                                         | *Optional[str]*                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                   | Opaque pagination token from a previous response.                                                                                                                                                                    |
| `page_size`                                                                                                                                                                                                          | *Optional[int]*                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                   | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                                                     |
| `email_contains`                                                                                                                                                                                                     | *Optional[str]*                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                   | Case-insensitive substring match.<br/> REST: ?field.contains=value                                                                                                                                                   |
| `email_exact`                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                   | Exact match (case-sensitive).<br/> REST: ?field.exact=value                                                                                                                                                          |
| `sender_id`                                                                                                                                                                                                          | *Optional[str]*                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                   | Filter by sender. Only returns invitations sent by this user.<br/> REST: ?sender_id=user_01h2xcejqtf2nbrexx3vqjhp41<br/> Pattern: user_[0-9a-hjkmnp-tv-z]{26}                                                        |
| `created_after_seconds`                                                                                                                                                                                              | [Optional[models.ListOrganizationInvitesSeconds]](../../models/listorganizationinvitesseconds.md)                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                   | Represents seconds of UTC time since Unix epoch<br/> 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to<br/> 9999-12-31T23:59:59Z inclusive.                                                                 |
| `created_after_nanos`                                                                                                                                                                                                | *Optional[int]*                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                   | Non-negative fractions of a second at nanosecond resolution. Negative<br/> second values with fractions must still have non-negative nanos values<br/> that count forward in time. Must be from 0 to 999,999,999<br/> inclusive. |
| `retries`                                                                                                                                                                                                            | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                     | :heavy_minus_sign:                                                                                                                                                                                                   | Configuration to override the default retry behavior of the client.                                                                                                                                                  |

### Response

**[models.FactifyAPIV1betaListOrganizationInvitesResponse](../../models/factifyapiv1betalistorganizationinvitesresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create_organization_invite

Creates an invitation and sends an email to the specified address. Returns FAILED_PRECONDITION if the email belongs to an existing organization member. Idempotency: If a PENDING invitation already exists for this email, the existing invitation is resent with a new token and refreshed expiration. Expired or revoked invitations are ignored - a new invitation is created.

### Example Usage

<!-- UsageSnippet language="python" operationID="createOrganizationInvite" method="post" path="/v1beta/organizations/{organization_id}/invites" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organization_service.create_organization_invite(organization_id_param="<id>", organization_id="<id>", email="Willie_Parisian16@hotmail.com")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                         | Type                                                                                                                                                                                                              | Required                                                                                                                                                                                                          | Description                                                                                                                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `organization_id_param`                                                                                                                                                                                           | *str*                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                | Organization to invite the user to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                      |
| `organization_id`                                                                                                                                                                                                 | *str*                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                | Organization to invite the user to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26}                                                                                                                                      |
| `email`                                                                                                                                                                                                           | *str*                                                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                                                | Email address of the recipient.                                                                                                                                                                                   |
| `message`                                                                                                                                                                                                         | *OptionalNullable[str]*                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                | Optional custom message from the sender (max 2000 bytes to support ~500 multibyte characters).                                                                                                                    |
| `idempotency_key`                                                                                                                                                                                                 | *OptionalNullable[str]*                                                                                                                                                                                           | :heavy_minus_sign:                                                                                                                                                                                                | Reserved for future use. Currently, idempotency is based on email matching:<br/> if a PENDING invitation exists for the same email in this organization,<br/> that invitation is resent rather than creating a duplicate. |
| `retries`                                                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                                                               |

### Response

**[models.FactifyAPIV1betaCreateOrganizationInviteResponse](../../models/factifyapiv1betacreateorganizationinviteresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
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

    res = f_client.organization_service.accept_organization_invite(organization_id_param="<id>", organization_id="<id>", token="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `organization_id_param`                                                                       | *str*                                                                                         | :heavy_check_mark:                                                                            | Organization the invitation belongs to (for validation).<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `organization_id`                                                                             | *str*                                                                                         | :heavy_check_mark:                                                                            | Organization the invitation belongs to (for validation).<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `token`                                                                                       | *str*                                                                                         | :heavy_check_mark:                                                                            | The invitation token from the email link.                                                     |
| `retries`                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                              | :heavy_minus_sign:                                                                            | Configuration to override the default retry behavior of the client.                           |

### Response

**[models.FactifyAPIV1betaAcceptOrganizationInviteResponse](../../models/factifyapiv1betaacceptorganizationinviteresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
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

    res = f_client.organization_service.resend_organization_invite(organization_id_param="<id>", invite_id_param="<id>", organization_id="<id>", invite_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                    | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `organization_id_param`                                                      | *str*                                                                        | :heavy_check_mark:                                                           | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `invite_id_param`                                                            | *str*                                                                        | :heavy_check_mark:                                                           | Invitation ID to resend.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}            |
| `organization_id`                                                            | *str*                                                                        | :heavy_check_mark:                                                           | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `invite_id`                                                                  | *str*                                                                        | :heavy_check_mark:                                                           | Invitation ID to resend.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}            |
| `retries`                                                                    | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)             | :heavy_minus_sign:                                                           | Configuration to override the default retry behavior of the client.          |

### Response

**[models.FactifyAPIV1betaResendOrganizationInviteResponse](../../models/factifyapiv1betaresendorganizationinviteresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
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

    res = f_client.organization_service.revoke_organization_invite(organization_id_param="<id>", invite_id_param="<id>", organization_id="<id>", invite_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                    | Type                                                                         | Required                                                                     | Description                                                                  |
| ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `organization_id_param`                                                      | *str*                                                                        | :heavy_check_mark:                                                           | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `invite_id_param`                                                            | *str*                                                                        | :heavy_check_mark:                                                           | Invitation ID to revoke.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}            |
| `organization_id`                                                            | *str*                                                                        | :heavy_check_mark:                                                           | Organization the invitation belongs to.<br/> Pattern: org_[0-9a-hjkmnp-tv-z]{26} |
| `invite_id`                                                                  | *str*                                                                        | :heavy_check_mark:                                                           | Invitation ID to revoke.<br/> Pattern: inv_[0-9a-hjkmnp-tv-z]{26}            |
| `retries`                                                                    | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)             | :heavy_minus_sign:                                                           | Configuration to override the default retry behavior of the client.          |

### Response

**[models.FactifyAPIV1betaRevokeOrganizationInviteResponse](../../models/factifyapiv1betarevokeorganizationinviteresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |