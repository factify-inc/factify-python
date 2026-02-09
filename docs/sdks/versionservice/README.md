# VersionService

## Overview

VersionService provides operations on document versions.
 Tags default to "VersionService", post-processor renames to "Versions".

### Available Operations

* [list_document_versions](#list_document_versions) - List document versions
* [create_document_version](#create_document_version) - Create a new version
* [get_version](#get_version) - Retrieve a version
* [update_version](#update_version) - Update a version

## list_document_versions

List versions for a document with cursor-based pagination.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocumentVersions" method="get" path="/v1beta/documents/{document_id}/versions" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.version_service.list_document_versions(document_id="<id>", page_token="eyJpZCI6InZlcl8wMWgyYWJjZDEyMzRlZmdoNTY3OGprbW5wdCIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                         | Type                                                                                                                                                                              | Required                                                                                                                                                                          | Description                                                                                                                                                                       | Example                                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                                                                                                     | *str*                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                | Document ID to list versions for.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}                                                                                                        |                                                                                                                                                                                   |
| `page_token`                                                                                                                                                                      | *Optional[str]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page. | eyJpZCI6InZlcl8wMWgyYWJjZDEyMzRlZmdoNTY3OGprbW5wdCIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0                                               |
| `page_size`                                                                                                                                                                       | *Optional[int]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                  |                                                                                                                                                                                   |
| `retries`                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                               |                                                                                                                                                                                   |

### Response

**[models.FactifyAPIV1betaListVersionsResponse](../../models/factifyapiv1betalistversionsresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create_document_version

Creates a new version by uploading a PDF file.

### Example Usage

<!-- UsageSnippet language="python" operationID="createDocumentVersion" method="post" path="/v1beta/documents/{document_id}/versions" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.version_service.create_document_version(document_id_param="<value>", payload={
        "file_name": "example.file",
        "content": open("example.file", "rb"),
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                         | Type                                                                                                              | Required                                                                                                          | Description                                                                                                       |
| ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `document_id_param`                                                                                               | *str*                                                                                                             | :heavy_check_mark:                                                                                                | Document ID to create version for.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}                                       |
| `payload`                                                                                                         | [models.FactifyAPIV1betaCreateVersionRequestPayload](../../models/factifyapiv1betacreateversionrequestpayload.md) | :heavy_check_mark:                                                                                                | PDF file for new version                                                                                          |
| `document_id`                                                                                                     | *Optional[str]*                                                                                                   | :heavy_minus_sign:                                                                                                | Document ID to create version for.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}                                       |
| `title`                                                                                                           | *OptionalNullable[str]*                                                                                           | :heavy_minus_sign:                                                                                                | Optional version title.                                                                                           |
| `description`                                                                                                     | *OptionalNullable[str]*                                                                                           | :heavy_minus_sign:                                                                                                | Description of changes in this version.                                                                           |
| `retries`                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                  | :heavy_minus_sign:                                                                                                | Configuration to override the default retry behavior of the client.                                               |

### Response

**[models.FactifyAPIV1betaVersion](../../models/factifyapiv1betaversion.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get_version

Retrieve a specific version by ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getVersion" method="get" path="/v1beta/versions/{version_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.version_service.get_version(version_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `version_id`                                                        | *str*                                                               | :heavy_check_mark:                                                  | Version ID to retrieve.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26}    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaVersion](../../models/factifyapiv1betaversion.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update_version

Update version title and description.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateVersion" method="patch" path="/v1beta/versions/{version_id}" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.version_service.update_version(version_id_param="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `version_id_param`                                                  | *str*                                                               | :heavy_check_mark:                                                  | Version ID to update.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26}      |
| `version_id`                                                        | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Version ID to update.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26}      |
| `title`                                                             | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New title (max 255 characters).                                     |
| `description`                                                       | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New description.                                                    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaVersion](../../models/factifyapiv1betaversion.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |