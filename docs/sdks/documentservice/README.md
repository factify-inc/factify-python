# DocumentService

## Overview

DocumentService provides operations on documents.
 Tags default to "DocumentService", post-processor renames to "Documents".

### Available Operations

* [list_documents](#list_documents) - List documents
* [create_document](#create_document) - Create a document
* [get_document](#get_document) - Retrieve a document
* [update_document](#update_document) - Update a document

## list_documents

List documents with cursor-based pagination.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocuments" method="get" path="/v1beta/documents" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.document_service.list_documents(page_token="eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                                                                                                                                             | Type                                                                                                                                                                                                                                                                                                  | Required                                                                                                                                                                                                                                                                                              | Description                                                                                                                                                                                                                                                                                           | Example                                                                                                                                                                                                                                                                                               |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `page_token`                                                                                                                                                                                                                                                                                          | *Optional[str]*                                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page.                                                                                                             | eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0                                                                                                                                                                                                                                   |
| `page_size`                                                                                                                                                                                                                                                                                           | *Optional[int]*                                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                       |
| `created_after_seconds`                                                                                                                                                                                                                                                                               | [Optional[models.ListDocumentsSeconds]](../../models/listdocumentsseconds.md)                                                                                                                                                                                                                         | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Represents seconds of UTC time since Unix epoch<br/> 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to<br/> 9999-12-31T23:59:59Z inclusive.                                                                                                                                                  |                                                                                                                                                                                                                                                                                                       |
| `created_after_nanos`                                                                                                                                                                                                                                                                                 | *Optional[int]*                                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Non-negative fractions of a second at nanosecond resolution. Negative<br/> second values with fractions must still have non-negative nanos values<br/> that count forward in time. Must be from 0 to 999,999,999<br/> inclusive.                                                                      |                                                                                                                                                                                                                                                                                                       |
| `created_by_id`                                                                                                                                                                                                                                                                                       | *Optional[str]*                                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Filter by creator ID(s) (user or service account). Returns documents matching ANY of the specified IDs.<br/> Accepts single value or comma-separated list.<br/> REST: ?created_by_id=user_01h2xcejqtf2nbrexx3vqjhp41 or ?created_by_id=user_xxx,svc_yyy                                               |                                                                                                                                                                                                                                                                                                       |
| `access_level`                                                                                                                                                                                                                                                                                        | *Optional[str]*                                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Filter by access level(s). Returns documents matching ANY of the specified levels.<br/> Accepts single value or comma-separated list.<br/> REST: ?access_level=private or ?access_level=private,organization<br/> Accepts clean enum names (case-insensitive): "private", "organization", "public"    |                                                                                                                                                                                                                                                                                                       |
| `processing_status`                                                                                                                                                                                                                                                                                   | *Optional[str]*                                                                                                                                                                                                                                                                                       | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Filter by processing status(es). Returns documents matching ANY of the specified statuses.<br/> Accepts single value or comma-separated list.<br/> REST: ?processing_status=ready or ?processing_status=processing,ready,failed<br/> Accepts clean enum names (case-insensitive): "processing", "ready", "failed" |                                                                                                                                                                                                                                                                                                       |
| `retries`                                                                                                                                                                                                                                                                                             | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                                                                                                                                      | :heavy_minus_sign:                                                                                                                                                                                                                                                                                    | Configuration to override the default retry behavior of the client.                                                                                                                                                                                                                                   |                                                                                                                                                                                                                                                                                                       |

### Response

**[models.FactifyAPIV1betaListDocumentsResponse](../../models/factifyapiv1betalistdocumentsresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create_document

Creates a new document by uploading a PDF file.

### Example Usage

<!-- UsageSnippet language="python" operationID="createDocument" method="post" path="/v1beta/documents" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.document_service.create_document(payload={
        "file_name": "example.file",
        "content": open("example.file", "rb"),
    }, title="<value>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                           | Type                                                                                                                | Required                                                                                                            | Description                                                                                                         |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `payload`                                                                                                           | [models.FactifyAPIV1betaCreateDocumentRequestPayload](../../models/factifyapiv1betacreatedocumentrequestpayload.md) | :heavy_check_mark:                                                                                                  | PDF file to upload                                                                                                  |
| `title`                                                                                                             | *str*                                                                                                               | :heavy_check_mark:                                                                                                  | Document title.                                                                                                     |
| `description`                                                                                                       | *OptionalNullable[str]*                                                                                             | :heavy_minus_sign:                                                                                                  | Optional document description.                                                                                      |
| `access_level`                                                                                                      | [Optional[models.FactifyAPIV1betaAccessLevel]](../../models/factifyapiv1betaaccesslevel.md)                         | :heavy_minus_sign:                                                                                                  | N/A                                                                                                                 |
| `retries`                                                                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                    | :heavy_minus_sign:                                                                                                  | Configuration to override the default retry behavior of the client.                                                 |

### Response

**[models.FactifyAPIV1betaCreateDocumentResponse](../../models/factifyapiv1betacreatedocumentresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get_document

Retrieve a document by ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getDocument" method="get" path="/v1beta/documents/{document_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.document_service.get_document(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaGetDocumentResponse](../../models/factifyapiv1betagetdocumentresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update_document

Update document title and description.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateDocument" method="patch" path="/v1beta/documents/{document_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.document_service.update_document(document_id_param="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id_param`                                                 | *str*                                                               | :heavy_check_mark:                                                  | Document ID to update.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}     |
| `document_id`                                                       | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Document ID to update.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}     |
| `title`                                                             | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New title (1-255 characters).                                       |
| `description`                                                       | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New description (max 2000 characters).                              |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaUpdateDocumentResponse](../../models/factifyapiv1betaupdatedocumentresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |