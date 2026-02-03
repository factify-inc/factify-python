# EntryPages

## Overview

### Available Operations

* [generate](#generate) - Generate entry page

## generate

Generate and return a temporary downloadable URL for the document entry page PDF.

### Example Usage

<!-- UsageSnippet language="python" operationID="generateDocumentEntryPage" method="post" path="/v1beta/documents/{document_id}/entry_page" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.entry_pages.generate(document_id="<id>")

    assert res.generate_entry_page_response is not None

    # Handle response
    print(res.generate_entry_page_response)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.<br/> Pattern: doc_[0-9a-hjkmnp-tv-z]{26}               |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |

### Response

**[models.GenerateDocumentEntryPageResponse](../../models/generatedocumententrypageresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.Error               | 400, 401, 403, 404         | application/json           |
| errors.Error               | 429                        | application/json           |
| errors.Error               | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |