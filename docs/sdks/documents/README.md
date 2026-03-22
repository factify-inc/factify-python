# Documents

## Overview

Create and manage legally-binding documents.

### Available Operations

* [list](#list) - List documents
* [create](#create) - Create a document
* [get_document_quota](#get_document_quota) - Get document quota
* [get](#get) - Retrieve a document
* [update](#update) - Update a document
* [list_duplicates](#list_duplicates) - List duplicate documents
* [export](#export) - Export a document
* [process](#process) - Process a document
* [transfer_ownership](#transfer_ownership) - Transfer document ownership
* [trash](#trash) - Trash a document
* [untrash](#untrash) - Restore a document from trash

## list

List documents with cursor-based pagination.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocuments" method="get" path="/v1beta/documents" -->
```python
from factify import Factify
from factify.utils import parse_datetime


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.list(page_token="eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0", created_after=parse_datetime("2023-01-15T01:30:15.01Z"), created_before=parse_datetime("2023-01-15T01:30:15.01Z"))

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                                                                                                            | Type                                                                                                                                                                                                                                 | Required                                                                                                                                                                                                                             | Description                                                                                                                                                                                                                          | Example                                                                                                                                                                                                                              |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `page_token`                                                                                                                                                                                                                         | *Optional[str]*                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                   | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page.                                            | eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0                                                                                                                                                                  |
| `page_size`                                                                                                                                                                                                                          | *Optional[int]*                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                   | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                                                                     |                                                                                                                                                                                                                                      |
| `created_after`                                                                                                                                                                                                                      | [date](https://docs.python.org/3/library/datetime.html#date-objects)                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                                                                   | Return results after this timestamp (inclusive).                                                                                                                                                                                     | 2023-01-15T01:30:15.01Z                                                                                                                                                                                                              |
| `created_before`                                                                                                                                                                                                                     | [date](https://docs.python.org/3/library/datetime.html#date-objects)                                                                                                                                                                 | :heavy_minus_sign:                                                                                                                                                                                                                   | Return results before this timestamp (inclusive).                                                                                                                                                                                    | 2023-01-15T01:30:15.01Z                                                                                                                                                                                                              |
| `created_by_id`                                                                                                                                                                                                                      | List[*str*]                                                                                                                                                                                                                          | :heavy_minus_sign:                                                                                                                                                                                                                   | Filter by creator ID(s) (user or bot). Returns documents matching ANY of the specified IDs.<br/> REST: ?created_by_id=user_01h2xcejqtf2nbrexx3vqjhp41 or ?created_by_id=user_xxx&created_by_id=bot_yyy                               |                                                                                                                                                                                                                                      |
| `access_level`                                                                                                                                                                                                                       | List[[models.AccessLevel](../../models/accesslevel.md)]                                                                                                                                                                              | :heavy_minus_sign:                                                                                                                                                                                                                   | Filter by access level(s). Returns documents matching ANY of the specified levels.<br/> REST: ?access_level=private or ?access_level=private&access_level=organization                                                               |                                                                                                                                                                                                                                      |
| `processing_status`                                                                                                                                                                                                                  | List[[models.ProcessingStatus](../../models/processingstatus.md)]                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                                                   | Filter by processing status(es). Returns documents matching ANY of the specified statuses.<br/> REST: ?processing_status=ready or ?processing_status=processing&processing_status=ready                                              |                                                                                                                                                                                                                                      |
| `sort`                                                                                                                                                                                                                               | *Optional[str]*                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                   | Sort field and direction. Prefix with `-` for descending order.<br/> Allowed values: created_at, updated_at, name, last_viewed_at, last_shared_at.<br/> Default (omitted): created_at descending.<br/> REST: ?sort=last_viewed_at or ?sort=-name |                                                                                                                                                                                                                                      |
| `query`                                                                                                                                                                                                                              | *Optional[str]*                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                   | Full-text search filter. Case-insensitive substring match on document name and description.<br/> REST: ?query=budget                                                                                                                 |                                                                                                                                                                                                                                      |
| `ownership`                                                                                                                                                                                                                          | List[[models.DocumentOwnership](../../models/documentownership.md)]                                                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                                                   | Ownership filter. Returns documents matching the specified ownership state.<br/> REST: ?ownership=owned or ?ownership=not_owned                                                                                                      |                                                                                                                                                                                                                                      |
| `trash_state`                                                                                                                                                                                                                        | List[[models.DocumentTrashState](../../models/documenttrashstate.md)]                                                                                                                                                                | :heavy_minus_sign:                                                                                                                                                                                                                   | Trash state filter. Returns documents matching the specified trash state.<br/> REST: ?trash_state=active or ?trash_state=trashed or ?trash_state=active&trash_state=trashed<br/> Default (omitted): active documents only.           |                                                                                                                                                                                                                                      |
| `organization_scope`                                                                                                                                                                                                                 | *Optional[bool]*                                                                                                                                                                                                                     | :heavy_minus_sign:                                                                                                                                                                                                                   | Organization scope filter. When true, restrict to documents within the user's organization.<br/> REST: ?organization_scope=true                                                                                                      |                                                                                                                                                                                                                                      |
| `retries`                                                                                                                                                                                                                            | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                     | :heavy_minus_sign:                                                                                                                                                                                                                   | Configuration to override the default retry behavior of the client.                                                                                                                                                                  |                                                                                                                                                                                                                                      |

### Response

**[models.ListDocumentsResponseResponse](../../models/listdocumentsresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create

Creates a new document by uploading a PDF file.

### Example Usage

<!-- UsageSnippet language="python" operationID="createDocument" method="post" path="/v1beta/documents" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.create(payload={
        "file_name": "example.file",
        "content": open("example.file", "rb"),
    }, title="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `payload`                                                                                     | [models.CreateDocumentRequestPayload](../../models/createdocumentrequestpayload.md)           | :heavy_check_mark:                                                                            | PDF file to upload                                                                            |
| `title`                                                                                       | *str*                                                                                         | :heavy_check_mark:                                                                            | Document title.                                                                               |
| `access_level`                                                                                | [OptionalNullable[models.AccessLevel]](../../models/accesslevel.md)                           | :heavy_minus_sign:                                                                            | Document access level. Defaults to organization if user belongs to an org, otherwise private. |
| `description`                                                                                 | *OptionalNullable[str]*                                                                       | :heavy_minus_sign:                                                                            | Optional document description.                                                                |
| `retries`                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                              | :heavy_minus_sign:                                                                            | Configuration to override the default retry behavior of the client.                           |

### Response

**[models.CreateDocumentResponseResponse](../../models/createdocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get_document_quota

Returns the document quota status for the authenticated user's organization, including the number of documents used, the configured limit, and remaining capacity.

### Example Usage

<!-- UsageSnippet language="python" operationID="getDocumentQuota" method="get" path="/v1beta/documents/quota" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.get_document_quota()

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.GetDocumentQuotaResponseResponse](../../models/getdocumentquotaresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get

Retrieve a document by ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getDocument" method="get" path="/v1beta/documents/{document_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.get(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.GetDocumentResponseResponse](../../models/getdocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update

Update document title and description.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateDocument" method="patch" path="/v1beta/documents/{document_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.update(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID to update.                                              | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `description`                                                       | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New description (max 2000 characters).                              |                                                                     |
| `title`                                                             | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New title (1-255 characters).                                       |                                                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.UpdateDocumentResponseResponse](../../models/updatedocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## list_duplicates

Finds documents that are visual duplicates of the specified document using perceptual hashing.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocumentDuplicates" method="get" path="/v1beta/documents/{document_id}/duplicates" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.list_duplicates(document_id="doc_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                            | Type                                                                 | Required                                                             | Description                                                          | Example                                                              |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `document_id`                                                        | *str*                                                                | :heavy_check_mark:                                                   | Document ID to check for duplicates.                                 | doc_01h2xcejqtf2nbrexx3vqjhp41                                       |
| `file_contents_hash`                                                 | *Optional[str]*                                                      | :heavy_minus_sign:                                                   | SHA256 hash of the document's visual content for duplicate matching. |                                                                      |
| `retries`                                                            | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)     | :heavy_minus_sign:                                                   | Configuration to override the default retry behavior of the client.  |                                                                      |

### Response

**[models.ListDocumentDuplicatesResponseResponse](../../models/listdocumentduplicatesresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## export

Generates a time-limited download URL for the document PDF.

### Example Usage

<!-- UsageSnippet language="python" operationID="exportDocument" method="get" path="/v1beta/documents/{document_id}/export" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.export(document_id="doc_01h2xcejqtf2nbrexx3vqjhp41", version_id="ver_01h2abcd1234efgh5678jkmnpt")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `version_id`                                                        | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Optional version ID. If omitted, exports the current version.       | ver_01h2abcd1234efgh5678jkmnpt                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.ExportDocumentResponseResponse](../../models/exportdocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## process

Triggers the AI processing pipeline (extraction and summarization) for the document's current or specified version.

### Example Usage

<!-- UsageSnippet language="python" operationID="processDocument" method="post" path="/v1beta/documents/{document_id}/process" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.process(document_id="doc_01h2xcejqtf2nbrexx3vqjhp41", version_id="ver_01h2abcd1234efgh5678jkmnpt")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                | Type                                                                     | Required                                                                 | Description                                                              | Example                                                                  |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `document_id`                                                            | *str*                                                                    | :heavy_check_mark:                                                       | Document ID.                                                             | doc_01h2xcejqtf2nbrexx3vqjhp41                                           |
| `async_`                                                                 | *Optional[bool]*                                                         | :heavy_minus_sign:                                                       | If true, returns immediately without waiting for processing to complete. |                                                                          |
| `version_id`                                                             | *OptionalNullable[str]*                                                  | :heavy_minus_sign:                                                       | Optional version ID. If omitted, processes the current version.          | ver_01h2abcd1234efgh5678jkmnpt                                           |
| `retries`                                                                | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)         | :heavy_minus_sign:                                                       | Configuration to override the default retry behavior of the client.      |                                                                          |

### Response

**[models.ProcessDocumentResponseResponse](../../models/processdocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## transfer_ownership

Transfers ownership of a document to another user in the organization.

### Example Usage

<!-- UsageSnippet language="python" operationID="transferDocumentOwnership" method="post" path="/v1beta/documents/{document_id}/transfer" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.transfer_ownership(document_id="doc_01h2xcejqtf2nbrexx3vqjhp41", new_owner_id="user_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `new_owner_id`                                                      | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | User ID of the new owner.                                           | user_01h2xcejqtf2nbrexx3vqjhp41                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.TransferDocumentOwnershipResponseResponse](../../models/transferdocumentownershipresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## trash

Moves a document to trash and revokes all non-owner access.

### Example Usage

<!-- UsageSnippet language="python" operationID="trashDocument" method="post" path="/v1beta/documents/{document_id}/trash" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.trash(document_id="doc_01h2xcejqtf2nbrexx3vqjhp41", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                     | Type                                                                                          | Required                                                                                      | Description                                                                                   | Example                                                                                       |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `document_id`                                                                                 | *str*                                                                                         | :heavy_check_mark:                                                                            | Document ID.                                                                                  | doc_01h2xcejqtf2nbrexx3vqjhp41                                                                |
| `body`                                                                                        | [models.TrashDocumentTrashDocumentRequest](../../models/trashdocumenttrashdocumentrequest.md) | :heavy_check_mark:                                                                            | N/A                                                                                           |                                                                                               |
| `retries`                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                              | :heavy_minus_sign:                                                                            | Configuration to override the default retry behavior of the client.                           |                                                                                               |

### Response

**[models.TrashDocumentResponseResponse](../../models/trashdocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## untrash

Restores a document from trash. Previous sharing and access permissions are NOT restored.

### Example Usage

<!-- UsageSnippet language="python" operationID="untrashDocument" method="post" path="/v1beta/documents/{document_id}/untrash" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.untrash(document_id="doc_01h2xcejqtf2nbrexx3vqjhp41", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                             | Type                                                                                                  | Required                                                                                              | Description                                                                                           | Example                                                                                               |
| ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                         | *str*                                                                                                 | :heavy_check_mark:                                                                                    | Document ID.                                                                                          | doc_01h2xcejqtf2nbrexx3vqjhp41                                                                        |
| `body`                                                                                                | [models.UntrashDocumentUntrashDocumentRequest](../../models/untrashdocumentuntrashdocumentrequest.md) | :heavy_check_mark:                                                                                    | N/A                                                                                                   |                                                                                                       |
| `retries`                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                      | :heavy_minus_sign:                                                                                    | Configuration to override the default retry behavior of the client.                                   |                                                                                                       |

### Response

**[models.UntrashDocumentResponseResponse](../../models/untrashdocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |