# PolicyService

## Overview

PolicyService provides operations on document policies.
 Tags default to "PolicyService", post-processor renames to "Policies".

### Available Operations

* [list_document_policies](#list_document_policies) - List document policies
* [attach_document_policy](#attach_document_policy) - Attach a policy
* [detach_document_policy](#detach_document_policy) - Detach a policy

## list_document_policies

List policies attached to a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocumentPolicies" method="get" path="/v1beta/documents/{document_id}/policies" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.policy_service.list_document_policies(document_id="<id>", page_token="eyJpZCI6InBvbF8wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                                                                         | Type                                                                                                                                                                              | Required                                                                                                                                                                          | Description                                                                                                                                                                       | Example                                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                                                                                                     | *str*                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}                                                                                                                             |                                                                                                                                                                                   |
| `page_token`                                                                                                                                                                      | *Optional[str]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page. | eyJpZCI6InBvbF8wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0                                               |
| `page_size`                                                                                                                                                                       | *Optional[int]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                  |                                                                                                                                                                                   |
| `retries`                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                               |                                                                                                                                                                                   |

### Response

**[models.FactifyAPIV1betaListDocumentPoliciesResponse](../../models/factifyapiv1betalistdocumentpoliciesresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## attach_document_policy

Attach a policy to a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="attachDocumentPolicy" method="post" path="/v1beta/documents/{document_id}/policies" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.policy_service.attach_document_policy(document_id_param="<id>", policy_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id_param`                                                 | *str*                                                               | :heavy_check_mark:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `policy_id`                                                         | *str*                                                               | :heavy_check_mark:                                                  | Policy ID to attach.<br/> Pattern: pol_[0-9a-hjkmnp-tv-z]{26}       |
| `document_id`                                                       | *Optional[str]*                                                     | :heavy_minus_sign:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.FactifyAPIV1betaDocumentPolicy](../../models/factifyapiv1betadocumentpolicy.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## detach_document_policy

Detach a policy from a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="detachDocumentPolicy" method="delete" path="/v1beta/documents/{document_id}/policies/{policy_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.policy_service.detach_document_policy(document_id="<id>", policy_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `policy_id`                                                         | *str*                                                               | :heavy_check_mark:                                                  | Policy ID to detach.<br/> Pattern: pol_[0-9a-hjkmnp-tv-z]{26}       |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.GoogleProtobufEmpty](../../models/googleprotobufempty.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |