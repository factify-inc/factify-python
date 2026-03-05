# Documents

## Overview

Create, retrieve, update, and manage documents.

### Available Operations

* [list](#list) - List documents
* [create](#create) - Create a document
* [get](#get) - Retrieve a document
* [update](#update) - Update a document

## list

List documents with cursor-based pagination.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocuments" method="get" path="/v1beta/documents" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.list(page_token="eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0")

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                                                                          | Type                                                                                                                                                                                               | Required                                                                                                                                                                                           | Description                                                                                                                                                                                        | Example                                                                                                                                                                                            |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `page_token`                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                 | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page.          | eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0                                                                                                                                |
| `page_size`                                                                                                                                                                                        | *Optional[int]*                                                                                                                                                                                    | :heavy_minus_sign:                                                                                                                                                                                 | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                                   |                                                                                                                                                                                                    |
| `created_by_id`                                                                                                                                                                                    | List[*str*]                                                                                                                                                                                        | :heavy_minus_sign:                                                                                                                                                                                 | Filter by creator ID(s) (user or bot). Returns documents matching ANY of the specified IDs.<br/> REST: ?created_by_id=user_01h2xcejqtf2nbrexx3vqjhp41 or ?created_by_id=user_xxx&created_by_id=bot_yyy |                                                                                                                                                                                                    |
| `access_level`                                                                                                                                                                                     | List[[models.AccessLevel](../../models/accesslevel.md)]                                                                                                                                            | :heavy_minus_sign:                                                                                                                                                                                 | Filter by access level(s). Returns documents matching ANY of the specified levels.<br/> REST: ?access_level=private or ?access_level=private&access_level=organization                             |                                                                                                                                                                                                    |
| `processing_status`                                                                                                                                                                                | List[[models.ProcessingStatus](../../models/processingstatus.md)]                                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                                 | Filter by processing status(es). Returns documents matching ANY of the specified statuses.<br/> REST: ?processing_status=ready or ?processing_status=processing&processing_status=ready            |                                                                                                                                                                                                    |
| `created_after`                                                                                                                                                                                    | [date](https://docs.python.org/3/library/datetime.html#date-objects)                                                                                                                               | :heavy_minus_sign:                                                                                                                                                                                 | Filter by created.after (RFC 3339 format, e.g., 2024-01-15T09:30:00Z)                                                                                                                              |                                                                                                                                                                                                    |
| `retries`                                                                                                                                                                                          | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                                 | Configuration to override the default retry behavior of the client.                                                                                                                                |                                                                                                                                                                                                    |

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

| Parameter                                                                           | Type                                                                                | Required                                                                            | Description                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `payload`                                                                           | [models.CreateDocumentRequestPayload](../../models/createdocumentrequestpayload.md) | :heavy_check_mark:                                                                  | PDF file to upload                                                                  |
| `title`                                                                             | *str*                                                                               | :heavy_check_mark:                                                                  | Document title.                                                                     |
| `access_level`                                                                      | [Optional[models.AccessLevel]](../../models/accesslevel.md)                         | :heavy_minus_sign:                                                                  | N/A                                                                                 |
| `description`                                                                       | *OptionalNullable[str]*                                                             | :heavy_minus_sign:                                                                  | Optional document description.                                                      |
| `retries`                                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                    | :heavy_minus_sign:                                                                  | Configuration to override the default retry behavior of the client.                 |

### Response

**[models.CreateDocumentResponseResponse](../../models/createdocumentresponseresponse.md)**

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

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

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

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID to update.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}     |
| `description`                                                       | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New description (max 2000 characters).                              |
| `title`                                                             | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New title (1-255 characters).                                       |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.UpdateDocumentResponseResponse](../../models/updatedocumentresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |