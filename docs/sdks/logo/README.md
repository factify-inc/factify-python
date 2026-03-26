# Organizations.Logo

## Overview

### Available Operations

* [upload](#upload) - Upload organization logo

## upload

Uploads a logo image for an organization. Accepts JPEG, PNG, WebP, or SVG formats up to 2 MB.

### Example Usage

<!-- UsageSnippet language="python" operationID="uploadOrganizationLogo" method="post" path="/v1beta/organizations/{organization_id}/logo" example="validation_error" -->
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.organizations.logo.upload(organization_id="org_01h2xcejqtf2nbrexx3vqjhp41")

    # Handle response
    print(res)

```

### Parameters

| Parameter                                                               | Type                                                                    | Required                                                                | Description                                                             | Example                                                                 |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| `organization_id`                                                       | *str*                                                                   | :heavy_check_mark:                                                      | Organization ID.                                                        | org_01h2xcejqtf2nbrexx3vqjhp41                                          |
| `content_type`                                                          | *Optional[str]*                                                         | :heavy_minus_sign:                                                      | Informational content type. The server detects format from magic bytes. |                                                                         |
| `image_data`                                                            | *Optional[str]*                                                         | :heavy_minus_sign:                                                      | Raw image bytes. Maximum 2 MB. Accepted formats: JPEG, PNG, WebP, SVG.  |                                                                         |
| `retries`                                                               | [Optional[utils.RetryConfig]](../../models/utils/retryconfig.md)        | :heavy_minus_sign:                                                      | Configuration to override the default retry behavior of the client.     |                                                                         |

### Response

**[models.UploadOrganizationLogoResponseResponse](../../models/uploadorganizationlogoresponseresponse.md)**

### Errors

| Error Type                 | Status Code                | Content Type               |
| -------------------------- | -------------------------- | -------------------------- |
| errors.ErrorResponse       | 400, 401, 403, 404         | application/json           |
| errors.ErrorResponse       | 429                        | application/json           |
| errors.ErrorResponse       | 500                        | application/json           |
| errors.FactifyDefaultError | 4XX, 5XX                   | \*/\*                      |