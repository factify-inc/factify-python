# AccessRequests

## Overview

### Available Operations

* [list](#list) - List access requests
* [create](#create) - Create an access request
* [check_status](#check_status) - Check access request status
* [approve](#approve) - Approve an access request
* [deny](#deny) - Deny an access request
* [inspect](#inspect) - Inspect document access

## list

Lists pending access requests for the specified document.

### Example Usage

<!-- UsageSnippet language="python" operationID="listAccessRequests" method="get" path="/v1beta/documents/{document_id}/access-requests" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.access_requests.list(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.ListAccessRequestsResponseResponse](../../models/listaccessrequestsresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## create

Creates a new access request for the specified document.

### Example Usage

<!-- UsageSnippet language="python" operationID="createAccessRequest" method="post" path="/v1beta/documents/{document_id}/access-requests" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.access_requests.create(document_id="<id>", permission="view", message="Need access for quarterly review")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                 | Type                                                                      | Required                                                                  | Description                                                               | Example                                                                   |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `document_id`                                                             | *str*                                                                     | :heavy_check_mark:                                                        | Document ID.                                                              | doc_01h2xcejqtf2nbrexx3vqjhp41                                            |
| `permission`                                                              | [models.AccessRequestPermission](../../models/accessrequestpermission.md) | :heavy_check_mark:                                                        | N/A                                                                       |                                                                           |
| `message`                                                                 | *OptionalNullable[str]*                                                   | :heavy_minus_sign:                                                        | Optional message from the requester.                                      | Need access for quarterly review                                          |
| `retries`                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)          | :heavy_minus_sign:                                                        | Configuration to override the default retry behavior of the client.       |                                                                           |

### Response

**[models.CreateAccessRequestResponseResponse](../../models/createaccessrequestresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## check_status

Returns whether the caller has a pending access request for the document.

### Example Usage

<!-- UsageSnippet language="python" operationID="checkAccessRequestStatus" method="get" path="/v1beta/documents/{document_id}/access-requests/status" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.access_requests.check_status(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.CheckAccessRequestStatusResponseResponse](../../models/checkaccessrequeststatusresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## approve

Approve an access request.

### Example Usage

<!-- UsageSnippet language="python" operationID="approveAccessRequest" method="post" path="/v1beta/documents/{document_id}/access-requests/{access_request_id}/approve" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.access_requests.approve(document_id="<id>", access_request_id="<id>", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                                 | Type                                                                                                                      | Required                                                                                                                  | Description                                                                                                               | Example                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                                             | *str*                                                                                                                     | :heavy_check_mark:                                                                                                        | Document ID.                                                                                                              | doc_01h2xcejqtf2nbrexx3vqjhp41                                                                                            |
| `access_request_id`                                                                                                       | *str*                                                                                                                     | :heavy_check_mark:                                                                                                        | Access request ID to approve.                                                                                             | acr_01h2xcejqtf2nbrexx3vqjhp42                                                                                            |
| `body`                                                                                                                    | [models.ApproveAccessRequestApproveAccessRequestRequest](../../models/approveaccessrequestapproveaccessrequestrequest.md) | :heavy_check_mark:                                                                                                        | N/A                                                                                                                       |                                                                                                                           |
| `retries`                                                                                                                 | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                                          | :heavy_minus_sign:                                                                                                        | Configuration to override the default retry behavior of the client.                                                       |                                                                                                                           |

### Response

**[models.ApproveAccessRequestResponseResponse](../../models/approveaccessrequestresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## deny

Deny an access request.

### Example Usage

<!-- UsageSnippet language="python" operationID="denyAccessRequest" method="post" path="/v1beta/documents/{document_id}/access-requests/{access_request_id}/deny" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.access_requests.deny(document_id="<id>", access_request_id="<id>", body={})

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                                                                     | Type                                                                                                          | Required                                                                                                      | Description                                                                                                   | Example                                                                                                       |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `document_id`                                                                                                 | *str*                                                                                                         | :heavy_check_mark:                                                                                            | Document ID.                                                                                                  | doc_01h2xcejqtf2nbrexx3vqjhp41                                                                                |
| `access_request_id`                                                                                           | *str*                                                                                                         | :heavy_check_mark:                                                                                            | Access request ID to deny.                                                                                    | acr_01h2xcejqtf2nbrexx3vqjhp42                                                                                |
| `body`                                                                                                        | [models.DenyAccessRequestDenyAccessRequestRequest](../../models/denyaccessrequestdenyaccessrequestrequest.md) | :heavy_check_mark:                                                                                            | N/A                                                                                                           |                                                                                                               |
| `retries`                                                                                                     | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)                                              | :heavy_minus_sign:                                                                                            | Configuration to override the default retry behavior of the client.                                           |                                                                                                               |

### Response

**[models.DenyAccessRequestResponseResponse](../../models/denyaccessrequestresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |

## inspect

Returns the caller's permissions and any access policies on a document.

### Example Usage

<!-- UsageSnippet language="python" operationID="inspectDocumentAccess" method="get" path="/v1beta/documents/{document_id}/capabilities" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.access_requests.inspect(document_id="<id>")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                           | Type                                                                | Required                                                            | Description                                                         | Example                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `document_id`                                                       | *str*                                                               | :heavy_check_mark:                                                  | Document ID.                                                        | doc_01h2xcejqtf2nbrexx3vqjhp41                                      |
| `retries`                                                           | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)    | :heavy_minus_sign:                                                  | Configuration to override the default retry behavior of the client. |                                                                     |

### Response

**[models.InspectDocumentAccessResponse](../../models/inspectdocumentaccessresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |