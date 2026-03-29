# Sharing

## Overview

### Available Operations

* [get_general_access](#get_general_access) - Get general access
* [set_general_access](#set_general_access) - Set general access
* [list](#list) - List document access
* [grant](#grant) - Grant document access
* [create_share_link](#create_share_link) - Create share link
* [revoke](#revoke) - Revoke document access
* [update](#update) - Update document access

## get_general_access

Get general access level for a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="getGeneralAccess" method="get" path="/v1beta/documents/{document_id}/general-access" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.get_general_access(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.GetGeneralAccessResponseResponse](../../models/getgeneralaccessresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## set_general_access

Set general access level for a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="setGeneralAccess" method="put" path="/v1beta/documents/{document_id}/general-access" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.set_general_access(document_id="<id>", general_access_level="organization")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `general_access_level`                                              | [models.GeneralAccessLevel](../../models/generalaccesslevel.md)     | :heavy_check_mark:                                                  | N/A                                                                 |                                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.SetGeneralAccessResponseResponse](../../models/setgeneralaccessresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## list

List all recipients with access to a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocumentAccess" method="get" path="/v1beta/documents/{document_id}/share" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.list(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.ListDocumentAccessResponseResponse](../../models/listdocumentaccessresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## grant

Grant access to one or more recipients.

### Example Usage

<!-- UsageSnippet language="python" operationID="grantDocumentAccess" method="post" path="/v1beta/documents/{document_id}/share" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.grant(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `custom_message`                                                    | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | Custom message to include in the notification email.                |                                                                     |
| `recipients`                                                        | List[[models.RecipientGrant](../../models/recipientgrant.md)]       | :heavy_minus_sign:                                                  | Recipients to grant access to (1-50).                               |                                                                     |
| `should_send_notification`                                          | *OptionalNullable[bool]*                                            | :heavy_minus_sign:                                                  | Whether to send email notifications.                                |                                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.GrantDocumentAccessResponseResponse](../../models/grantdocumentaccessresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create_share_link

Create a share link for a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="createShareLink" method="post" path="/v1beta/documents/{document_id}/share-links" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.create_share_link(document_id="<id>", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           | Example                                                                                               |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                         | *str*                                                                                                 | :heavy_check_mark:                                                                                    | Document ID.                                                                                          | doc_01h2xcejqtf2nbrexx3vqjhp41                                                                        |
| `body`                                                                                                | [models.CreateShareLinkCreateShareLinkRequest](../../models/createsharelinkcreatesharelinkrequest.md) | :heavy_check_mark:                                                                                    | N/A                                                                                                   |                                                                                                       |
| `retries`                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                      | :heavy_minus_sign:                                                                                    | Configuration to override the default retry behavior of the client.                                   |                                                                                                       |

### Response

**[models.CreateShareLinkResponseResponse](../../models/createsharelinkresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## revoke

Revoke access from a recipient.

### Example Usage

<!-- UsageSnippet language="python" operationID="revokeDocumentAccess" method="delete" path="/v1beta/documents/{document_id}/share/{recipient_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.revoke(document_id="<id>", recipient_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `recipient_id`                                                      | *str*                                                               | :heavy_check_mark:                                                  | Recipient ID (TypeID: user_xxx or bot_xxx).                         | user_01h2xcejqtf2nbrexx3vqjhp41                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.RevokeDocumentAccessResponseResponse](../../models/revokedocumentaccessresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update

Update a recipient's role.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateDocumentAccess" method="patch" path="/v1beta/documents/{document_id}/share/{recipient_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.sharing.update(document_id="<id>", recipient_id="<id>", document_role="admin")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `recipient_id`                                                      | *str*                                                               | :heavy_check_mark:                                                  | Recipient ID (TypeID: user_xxx or bot_xxx).                         | user_01h2xcejqtf2nbrexx3vqjhp41                                     |
| `document_role`                                                     | [models.DocumentRole](../../models/documentrole.md)                 | :heavy_check_mark:                                                  | N/A                                                                 |                                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.UpdateDocumentAccessResponseResponse](../../models/updatedocumentaccessresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |