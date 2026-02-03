# Versions

## Overview

Manage document versions and version history.

### Available Operations

* [list](#list) - List document versions
* [create](#create) - Create a new version
* [get](#get) - Retrieve a version
* [update](#update) - Update a version

## list

List versions for a document with cursor-based pagination.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocumentVersions" method="get" path="/v1beta/documents/{document_id}/versions" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.versions.list(document_id="<id>", page_token="eyJpZCI6InZlcl8wMWgyYWJjZDEyMzRlZmdoNTY3OGprbW5wdCIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0")

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                                                         | Type                                                                                                                                                                              | Required                                                                                                                                                                          | Description                                                                                                                                                                       | Example                                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                                                                                                     | *str*                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                | Document ID to list versions for.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}                                                                                                        |                                                                                                                                                                                   |
| `page_token`                                                                                                                                                                      | *Optional[str]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page. | eyJpZCI6InZlcl8wMWgyYWJjZDEyMzRlZmdoNTY3OGprbW5wdCIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0                                               |
| `page_size`                                                                                                                                                                       | *Optional[int]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                  |                                                                                                                                                                                   |
| `retries`                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                               |                                                                                                                                                                                   |

### Response

**[models.ListDocumentVersionsResponse](../../models/listdocumentversionsresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create

Creates a new version by uploading a PDF file.

### Example Usage

<!-- UsageSnippet language="python" operationID="createDocumentVersion" method="post" path="/v1beta/documents/{document_id}/versions" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.versions.create(document_id="<value>", payload={
        "file_name": "example.file",
        "content": open("example.file", "rb"),
    })

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                         | Type                                                                              | Required                                                                          | Description                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `document_id`                                                                     | *str*                                                                             | :heavy_check_mark:                                                                | Document ID to create version for.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}       |
| `payload`                                                                         | [models.CreateVersionRequestPayload](../../models/createversionrequestpayload.md) | :heavy_check_mark:                                                                | PDF file for new version                                                          |
| `description`                                                                     | *OptionalNullable[str]*                                                           | :heavy_minus_sign:                                                                | Description of changes in this version.                                           |
| `title`                                                                           | *OptionalNullable[str]*                                                           | :heavy_minus_sign:                                                                | Optional version title.                                                           |
| `retries`                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                  | :heavy_minus_sign:                                                                | Configuration to override the default retry behavior of the client.               |

### Response

**[models.CreateDocumentVersionResponse](../../models/createdocumentversionresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## get

Retrieve a specific version by ID.

### Example Usage

<!-- UsageSnippet language="python" operationID="getVersion" method="get" path="/v1beta/versions/{version_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.versions.get(version_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `version_id`                                                        | *str*                                                               | :heavy_check_mark:                                                  | Version ID to retrieve.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26}    |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.GetVersionResponse](../../models/getversionresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## update

Update version title and description.

### Example Usage

<!-- UsageSnippet language="python" operationID="updateVersion" method="patch" path="/v1beta/versions/{version_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.versions.update(version_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `version_id`                                                        | *str*                                                               | :heavy_check_mark:                                                  | Version ID to update.<br/> Pattern: ver_[0-9a-hjkmnp-tv-z]{26}      |
| `description`                                                       | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New description.                                                    |
| `title`                                                             | *OptionalNullable[str]*                                             | :heavy_minus_sign:                                                  | New title (max 255 characters).                                     |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.UpdateVersionResponse](../../models/updateversionresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |