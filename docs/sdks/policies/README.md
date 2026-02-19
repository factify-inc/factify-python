# Policies

## Overview

Attach and manage access policies for documents.

### Available Operations

* [list](#list) - List document policies
* [attach](#attach) - Attach a policy
* [detach](#detach) - Detach a policy

## list

List policies attached to a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="listDocumentPolicies" method="get" path="/v1beta/documents/{document_id}/policies" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.policies.list(document_id="<id>", page_token="eyJpZCI6InBvbF8wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0")

    while res is not None:
        # Handle items

        res = res.next()

```

### Parameters

| Parameter                                                                                                                                                                         | Type                                                                                                                                                                              | Required                                                                                                                                                                          | Description                                                                                                                                                                       | Example                                                                                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                                                                                                     | *str*                                                                                                                                                                             | :heavy_check_mark:                                                                                                                                                                | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}                                                                                                                             |                                                                                                                                                                                   |
| `page_token`                                                                                                                                                                      | *Optional[str]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Opaque pagination token from a previous response.<br/> Pass next_page_token or prev_page_token from a previous response to continue pagination.<br/> Empty or omitted for the first page. | eyJpZCI6InBvbF8wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0IiwiZiI6eyJkb2NfaWQiOiJkb2NfMDFoMnhjZWpxdGYybmJyZXh4M3ZxamhwNDEifX0                                               |
| `page_size`                                                                                                                                                                       | *Optional[int]*                                                                                                                                                                   | :heavy_minus_sign:                                                                                                                                                                | Maximum number of items to return per page (1-100). Default: 50.                                                                                                                  |                                                                                                                                                                                   |
| `retries`                                                                                                                                                                         | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                                                                                  | :heavy_minus_sign:                                                                                                                                                                | Configuration to override the default retry behavior of the client.                                                                                                               |                                                                                                                                                                                   |

### Response

**[models.ListDocumentPoliciesResponseResponse](../../models/listdocumentpoliciesresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## attach

Attach a policy to a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="attachDocumentPolicy" method="post" path="/v1beta/documents/{document_id}/policies" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.policies.attach(document_id="<id>", policy_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `policy_id`                                                         | *str*                                                               | :heavy_check_mark:                                                  | Policy ID to attach.<br/> Pattern: pol_[0-9a-hjkmnp-tv-z]{26}       |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.AttachDocumentPolicyResponse](../../models/attachdocumentpolicyresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## detach

Detach a policy from a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="detachDocumentPolicy" method="delete" path="/v1beta/documents/{document_id}/policies/{policy_id}" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.policies.detach(document_id="<id>", policy_id="<id>")

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

**[models.DetachDocumentPolicyResponse](../../models/detachdocumentpolicyresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |