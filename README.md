# Factify Python SDK

Python SDK for the Factify API.

<!-- Start Summary [summary] -->
## Summary

Factify API: Factify API enables you to create, manage, and control access to legally-binding documents that replace PDFs.

## Authentication

Bearer authentication header of the form Bearer <token>, where <token> is your auth token.

```
Authorization: Bearer ffy...
```

## Rate Limiting

- 1000 requests per minute per API key
- 100 requests per minute for resource creation (POST)

## Errors

Factify uses conventional HTTP status codes and returns structured error responses
using the [ConnectRPC error format](https://connectrpc.com/docs/protocol#error-codes):

```json
{
  "code": "invalid_argument",
  "message": "limit must be positive",
  "details": [
    {
      "reason": "invalid_field_value",
      "request_id": "req_01arwx4k8xrgqskvxq69gdn019",
      "param": "limit"
    }
  ]
}
```
<!-- End Summary [summary] -->

<!-- Start Table of Contents [toc] -->
## Table of Contents
<!-- $toc-max-depth=2 -->
* [Factify Python SDK](#factify-python-sdk)
  * [Authentication](#authentication)
  * [Rate Limiting](#rate-limiting)
  * [Errors](#errors)
  * [SDK Installation](#sdk-installation)
  * [IDE Support](#ide-support)
  * [SDK Example Usage](#sdk-example-usage)
  * [Authentication](#authentication-1)
  * [Available Resources and Operations](#available-resources-and-operations)
  * [Pagination](#pagination)
  * [File uploads](#file-uploads)
  * [Retries](#retries)
  * [Error Handling](#error-handling)
  * [Server Selection](#server-selection)
  * [Custom HTTP Client](#custom-http-client)
  * [Resource Management](#resource-management)
  * [Debugging](#debugging)

<!-- End Table of Contents [toc] -->

<!-- Start SDK Installation [installation] -->
## SDK Installation

> [!NOTE]
> **Python version upgrade policy**
>
> Once a Python version reaches its [official end of life date](https://devguide.python.org/versions/), a 3-month grace period is provided for users to upgrade. Following this grace period, the minimum python version supported in the SDK will be updated.

The SDK can be installed with *uv*, *pip*, or *poetry* package managers.

### uv

*uv* is a fast Python package installer and resolver, designed as a drop-in replacement for pip and pip-tools. It's recommended for its speed and modern Python tooling capabilities.

```bash
uv add factify
```

### PIP

*PIP* is the default package installer for Python, enabling easy installation and management of packages from PyPI via the command line.

```bash
pip install factify
```

### Poetry

*Poetry* is a modern tool that simplifies dependency management and package publishing by using a single `pyproject.toml` file to handle project metadata and dependencies.

```bash
poetry add factify
```

### Shell and script usage with `uv`

You can use this SDK in a Python shell with [uv](https://docs.astral.sh/uv/) and the `uvx` command that comes with it like so:

```shell
uvx --from factify python
```

It's also possible to write a standalone Python script without needing to set up a whole project like so:

```python
#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "factify",
# ]
# ///

from factify import Factify

sdk = Factify(
  # SDK arguments
)

# Rest of script here...
```

Once that is saved to a file, you can run it with `uv run script.py` where
`script.py` can be replaced with the actual file name.
<!-- End SDK Installation [installation] -->

<!-- Start IDE Support [idesupport] -->
## IDE Support

### PyCharm

Generally, the SDK will work well with most IDEs out of the box. However, when using PyCharm, you can enjoy much better integration with Pydantic by installing an additional plugin.

- [PyCharm Pydantic Plugin](https://docs.pydantic.dev/latest/integrations/pycharm/)
<!-- End IDE Support [idesupport] -->

<!-- Start SDK Example Usage [usage] -->
## SDK Example Usage

### Example

```python
# Synchronous Example
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.documents.list(page_token="eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0")

    while res is not None:
        # Handle items

        res = res.next()
```

</br>

The same SDK client can also be used to make asynchronous requests by importing asyncio.

```python
# Asynchronous Example
import asyncio
from factify import Factify

async def main():

    async with Factify(
        bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
    ) as f_client:

        res = await f_client.documents.list_async(page_token="eyJpZCI6ImRvY18wMWgyeGNlanF0ZjJuYnJleHgzdnFqaHA0MSIsImQiOiJuZXh0In0")

        while res is not None:
            # Handle items

            res = res.next()

asyncio.run(main())
```
<!-- End SDK Example Usage [usage] -->

<!-- Start Authentication [security] -->
## Authentication

### Per-Client Security Schemes

This SDK supports the following security scheme globally:

| Name          | Type | Scheme      |
| ------------- | ---- | ----------- |
| `bearer_auth` | http | HTTP Bearer |

To authenticate with the API the `bearer_auth` parameter must be set when initializing the SDK client instance. For example:
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_delete_organization_quota()

    # Handle response
    print(res)

```
<!-- End Authentication [security] -->

<!-- Start Available Resources and Operations [operations] -->
## Available Resources and Operations

<details open>
<summary>Available methods</summary>

### [APIKeys](docs/sdks/apikeys/README.md)

* [list](docs/sdks/apikeys/README.md#list) - List API keys
* [create](docs/sdks/apikeys/README.md#create) - Create an API key
* [revoke](docs/sdks/apikeys/README.md#revoke) - Revoke an API key

### [Documents](docs/sdks/documents/README.md)

* [list](docs/sdks/documents/README.md#list) - List documents
* [create](docs/sdks/documents/README.md#create) - Create a document
* [get](docs/sdks/documents/README.md#get) - Retrieve a document
* [update](docs/sdks/documents/README.md#update) - Update a document

### [EntryPages](docs/sdks/entrypages/README.md)

* [generate](docs/sdks/entrypages/README.md#generate) - Generate entry page

### [Organizations](docs/sdks/organizations/README.md)

* [list](docs/sdks/organizations/README.md#list) - List organizations
* [create](docs/sdks/organizations/README.md#create) - Create an organization
* [get](docs/sdks/organizations/README.md#get) - Retrieve an organization
* [accept_organization_invite](docs/sdks/organizations/README.md#accept_organization_invite) - Accept an invitation
* [resend_organization_invite](docs/sdks/organizations/README.md#resend_organization_invite) - Resend an invitation email
* [revoke_organization_invite](docs/sdks/organizations/README.md#revoke_organization_invite) - Revoke an invitation
* [list_organization_members](docs/sdks/organizations/README.md#list_organization_members) - List organization members
* [remove_organization_member](docs/sdks/organizations/README.md#remove_organization_member) - Remove an organization member
* [update_organization_member](docs/sdks/organizations/README.md#update_organization_member) - Update an organization member

### [Organizations.Invites](docs/sdks/invites/README.md)

* [list](docs/sdks/invites/README.md#list) - List organization invitations
* [create](docs/sdks/invites/README.md#create) - Invite a user to join an organization

### [Policies](docs/sdks/policies/README.md)

* [list](docs/sdks/policies/README.md#list) - List document policies
* [attach](docs/sdks/policies/README.md#attach) - Attach a policy
* [detach](docs/sdks/policies/README.md#detach) - Detach a policy

### [Quotas](docs/sdks/quotas/README.md)

* [quota_service_delete_organization_quota](docs/sdks/quotas/README.md#quota_service_delete_organization_quota) - DeleteOrganizationQuota removes quota configuration for an organization.  The organization will fall back to default free tier limits.  Requires platform admin permission. ConnectRPC only (not exposed via REST).
* [quota_service_set_organization_quota](docs/sdks/quotas/README.md#quota_service_set_organization_quota) - SetOrganizationQuota creates or updates quota configuration for an organization.  Requires platform admin permission. ConnectRPC only (not exposed via REST).

### [Usage](docs/sdks/usage/README.md)

* [get_organization_quota](docs/sdks/usage/README.md#get_organization_quota) - Get organization quota status
* [list_api_key_quotas](docs/sdks/usage/README.md#list_api_key_quotas) - List API key quotas
* [delete_api_key_quota](docs/sdks/usage/README.md#delete_api_key_quota) - Delete API key quota
* [set_api_key_quota](docs/sdks/usage/README.md#set_api_key_quota) - Set API key quota
* [get_usage_history](docs/sdks/usage/README.md#get_usage_history) - Get usage history

### [Versions](docs/sdks/versions/README.md)

* [list](docs/sdks/versions/README.md#list) - List document versions
* [create](docs/sdks/versions/README.md#create) - Create a new version
* [get](docs/sdks/versions/README.md#get) - Retrieve a version
* [update](docs/sdks/versions/README.md#update) - Update a version

</details>
<!-- End Available Resources and Operations [operations] -->

<!-- Start Pagination [pagination] -->
## Pagination

Some of the endpoints in this SDK support pagination. To use pagination, you make your SDK calls as usual, but the
returned response object will have a `Next` method that can be called to pull down the next group of results. If the
return value of `Next` is `None`, then there are no more pages to be fetched.

Here's an example of one such pagination call:
```python
from factify import Factify


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.api_keys.list(organization_id="<id>")

    while res is not None:
        # Handle items

        res = res.next()

```
<!-- End Pagination [pagination] -->

<!-- Start File uploads [file-upload] -->
## File uploads

Certain SDK methods accept file objects as part of a request body or multi-part request. It is possible and typically recommended to upload files as a stream rather than reading the entire contents into memory. This avoids excessive memory consumption and potentially crashing with out-of-memory errors when working with very large files. The following example demonstrates how to attach a file stream to a request.

> [!TIP]
>
> For endpoints that handle file uploads bytes arrays can also be used. However, using streams is recommended for large files.
>

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
<!-- End File uploads [file-upload] -->

<!-- Start Retries [retries] -->
## Retries

Some of the endpoints in this SDK support retries. If you use the SDK without any configuration, it will fall back to the default retry strategy provided by the API. However, the default retry strategy can be overridden on a per-operation basis, or across the entire SDK.

To change the default retry strategy for a single API call, simply provide a `RetryConfig` object to the call:
```python
from factify import Factify
from factify.utils import BackoffStrategy, RetryConfig


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_delete_organization_quota(,
        RetryConfig("backoff", BackoffStrategy(1, 50, 1.1, 100), False))

    # Handle response
    print(res)

```

If you'd like to override the default retry strategy for all operations that support retries, you can use the `retry_config` optional parameter when initializing the SDK:
```python
from factify import Factify
from factify.utils import BackoffStrategy, RetryConfig


with Factify(
    retry_config=RetryConfig("backoff", BackoffStrategy(1, 50, 1.1, 100), False),
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_delete_organization_quota()

    # Handle response
    print(res)

```
<!-- End Retries [retries] -->

<!-- Start Error Handling [errors] -->
## Error Handling

[`FactifyError`](./src/factify/errors/factifyerror.py) is the base class for all HTTP error responses. It has the following properties:

| Property           | Type             | Description                                                                             |
| ------------------ | ---------------- | --------------------------------------------------------------------------------------- |
| `err.message`      | `str`            | Error message                                                                           |
| `err.status_code`  | `int`            | HTTP response status code eg `404`                                                      |
| `err.headers`      | `httpx.Headers`  | HTTP response headers                                                                   |
| `err.body`         | `str`            | HTTP body. Can be empty string if no body is returned.                                  |
| `err.raw_response` | `httpx.Response` | Raw HTTP response                                                                       |
| `err.data`         |                  | Optional. Some errors may contain structured data. [See Error Classes](#error-classes). |

### Example
```python
from factify import Factify, errors


with Factify(
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:
    res = None
    try:

        res = f_client.quotas.quota_service_delete_organization_quota()

        # Handle response
        print(res)


    except errors.FactifyError as e:
        # The base class for HTTP error responses
        print(e.message)
        print(e.status_code)
        print(e.body)
        print(e.headers)
        print(e.raw_response)

        # Depending on the method different errors may be thrown
        if isinstance(e, errors.ErrorResponse):
            print(e.data.code)  # models.ErrorResponseCode
            print(e.data.details)  # Optional[List[models.ErrorDetail]]
            print(e.data.message)  # str
```

### Error Classes
**Primary errors:**
* [`FactifyError`](./src/factify/errors/factifyerror.py): The base class for HTTP error responses.
  * [`ErrorResponse`](./src/factify/errors/errorresponse.py): Invalid request parameters.

<details><summary>Less common errors (5)</summary>

<br />

**Network errors:**
* [`httpx.RequestError`](https://www.python-httpx.org/exceptions/#httpx.RequestError): Base class for request errors.
    * [`httpx.ConnectError`](https://www.python-httpx.org/exceptions/#httpx.ConnectError): HTTP client was unable to make a request to a server.
    * [`httpx.TimeoutException`](https://www.python-httpx.org/exceptions/#httpx.TimeoutException): HTTP request timed out.


**Inherit from [`FactifyError`](./src/factify/errors/factifyerror.py)**:
* [`ResponseValidationError`](./src/factify/errors/responsevalidationerror.py): Type mismatch between the response data and the expected Pydantic model. Provides access to the Pydantic validation error via the `cause` attribute.

</details>
<!-- End Error Handling [errors] -->

<!-- Start Server Selection [server] -->
## Server Selection

### Select Server by Index

You can override the default server globally by passing a server index to the `server_idx: int` optional parameter when initializing the SDK client instance. The selected server will then be used as the default on the operations that use it. This table lists the indexes associated with the available servers:

| #   | Server                        | Description                 |
| --- | ----------------------------- | --------------------------- |
| 0   | `https://api.factify.com`     | Production                  |
| 1   | `https://api.factify-dev.com` | Development (internal only) |

#### Example

```python
from factify import Factify


with Factify(
    server_idx=0,
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_delete_organization_quota()

    # Handle response
    print(res)

```

### Override Server URL Per-Client

The default server can also be overridden globally by passing a URL to the `server_url: str` optional parameter when initializing the SDK client instance. For example:
```python
from factify import Factify


with Factify(
    server_url="https://api.factify-dev.com",
    bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
) as f_client:

    res = f_client.quotas.quota_service_delete_organization_quota()

    # Handle response
    print(res)

```
<!-- End Server Selection [server] -->

<!-- Start Custom HTTP Client [http-client] -->
## Custom HTTP Client

The Python SDK makes API calls using the [httpx](https://www.python-httpx.org/) HTTP library.  In order to provide a convenient way to configure timeouts, cookies, proxies, custom headers, and other low-level configuration, you can initialize the SDK client with your own HTTP client instance.
Depending on whether you are using the sync or async version of the SDK, you can pass an instance of `HttpClient` or `AsyncHttpClient` respectively, which are Protocol's ensuring that the client has the necessary methods to make API calls.
This allows you to wrap the client with your own custom logic, such as adding custom headers, logging, or error handling, or you can just pass an instance of `httpx.Client` or `httpx.AsyncClient` directly.

For example, you could specify a header for every request that this sdk makes as follows:
```python
from factify import Factify
import httpx

http_client = httpx.Client(headers={"x-custom-header": "someValue"})
s = Factify(client=http_client)
```

or you could wrap the client with your own custom logic:
```python
from factify import Factify
from factify.httpclient import AsyncHttpClient
import httpx

class CustomClient(AsyncHttpClient):
    client: AsyncHttpClient

    def __init__(self, client: AsyncHttpClient):
        self.client = client

    async def send(
        self,
        request: httpx.Request,
        *,
        stream: bool = False,
        auth: Union[
            httpx._types.AuthTypes, httpx._client.UseClientDefault, None
        ] = httpx.USE_CLIENT_DEFAULT,
        follow_redirects: Union[
            bool, httpx._client.UseClientDefault
        ] = httpx.USE_CLIENT_DEFAULT,
    ) -> httpx.Response:
        request.headers["Client-Level-Header"] = "added by client"

        return await self.client.send(
            request, stream=stream, auth=auth, follow_redirects=follow_redirects
        )

    def build_request(
        self,
        method: str,
        url: httpx._types.URLTypes,
        *,
        content: Optional[httpx._types.RequestContent] = None,
        data: Optional[httpx._types.RequestData] = None,
        files: Optional[httpx._types.RequestFiles] = None,
        json: Optional[Any] = None,
        params: Optional[httpx._types.QueryParamTypes] = None,
        headers: Optional[httpx._types.HeaderTypes] = None,
        cookies: Optional[httpx._types.CookieTypes] = None,
        timeout: Union[
            httpx._types.TimeoutTypes, httpx._client.UseClientDefault
        ] = httpx.USE_CLIENT_DEFAULT,
        extensions: Optional[httpx._types.RequestExtensions] = None,
    ) -> httpx.Request:
        return self.client.build_request(
            method,
            url,
            content=content,
            data=data,
            files=files,
            json=json,
            params=params,
            headers=headers,
            cookies=cookies,
            timeout=timeout,
            extensions=extensions,
        )

s = Factify(async_client=CustomClient(httpx.AsyncClient()))
```
<!-- End Custom HTTP Client [http-client] -->

<!-- Start Resource Management [resource-management] -->
## Resource Management

The `Factify` class implements the context manager protocol and registers a finalizer function to close the underlying sync and async HTTPX clients it uses under the hood. This will close HTTP connections, release memory and free up other resources held by the SDK. In short-lived Python programs and notebooks that make a few SDK method calls, resource management may not be a concern. However, in longer-lived programs, it is beneficial to create a single SDK instance via a [context manager][context-manager] and reuse it across the application.

[context-manager]: https://docs.python.org/3/reference/datamodel.html#context-managers

```python
from factify import Factify
def main():

    with Factify(
        bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
    ) as f_client:
        # Rest of application here...


# Or when using async:
async def amain():

    async with Factify(
        bearer_auth="<YOUR_BEARER_TOKEN_HERE>",
    ) as f_client:
        # Rest of application here...
```
<!-- End Resource Management [resource-management] -->

<!-- Start Debugging [debug] -->
## Debugging

You can setup your SDK to emit debug logs for SDK requests and responses.

You can pass your own logger class directly into your SDK.
```python
from factify import Factify
import logging

logging.basicConfig(level=logging.DEBUG)
s = Factify(debug_logger=logging.getLogger("factify"))
```
<!-- End Debugging [debug] -->

<!-- Placeholder for Future Speakeasy SDK Sections -->
